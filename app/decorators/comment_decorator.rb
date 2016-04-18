class CommentDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%H:%M %d-%m-%Y")
  end

  def answer_given
    "Задан #{object.created_at.strftime("%H:%M %d-%m-%Y")}"
  end

  def comment_user_avatar
    object.user.avatar.avatar.url
  end

end
