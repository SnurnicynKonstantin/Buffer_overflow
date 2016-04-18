class UserDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%H:%M %d-%m-%Y")
  end

end
