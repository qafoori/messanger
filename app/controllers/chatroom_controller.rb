class ChatroomController < ApplicationController

  before_action :redirect_if_not_logged_in, only: %i[index]

  def index
    @message = Message.new
    @messages = Message.custom_display
  end

end
