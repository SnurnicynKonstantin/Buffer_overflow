class CommentDecorator < Draper::Decorator
  delegate_all

  def created_at_strftime
    object.created_at.strftime("%H:%M %d-%m-%Y")
  end

  def answer_given
    "Дан #{object.created_at.strftime("%H:%M %d-%m-%Y")}"
  end

  def comment_user_avatar
    object.user.avatar.avatar.url
  end

end
