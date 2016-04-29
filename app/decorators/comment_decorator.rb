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

  def less_them_default?
    current_user && ((object.inserted_count + 1) <= Setting.inserted_comment_count)
  end

  def comment_less_then_inserted_comment_count? (current_user)
    (current_user && ((object.inserted_count + 1) < Setting.inserted_comment_count))
  end

end
