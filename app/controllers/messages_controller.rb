class MessagesController < ApplicationController

  before_action :require_user

  def index
    @messages = Message.all
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'chatroom_channel', mod_message: render_message(message)
      # redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end

end
