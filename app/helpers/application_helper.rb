module ApplicationHelper

  def check_flash(name)
    case name
    when 'alert'
      'warning'
    when 'info'
      'info'
    when 'success'
      'positive'
    else
      'info'
    end
  end

end
