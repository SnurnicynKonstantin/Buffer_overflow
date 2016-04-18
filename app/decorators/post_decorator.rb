class PostDecorator < Draper::Decorator
  delegate_all

  def created_at_strftime
    object.created_at.strftime("%H:%M %d-%m-%Y")
  end

  def created_at_with_text
    "Задан #{object.created_at.strftime("%H:%M %d-%m-%Y")}"
  end

  def tag_of_post
    "[#{object.tags.first.tag_name}]"
  end

end
