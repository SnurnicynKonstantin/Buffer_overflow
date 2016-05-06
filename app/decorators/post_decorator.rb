class PostDecorator < ApplicationDecorator
  delegate_all

  def created_at_strftime
    object.created_at.strftime("%d-%m-%Y %H:%M")
  end

  def updated_at_strftime
    object.updated_at.strftime("%d-%m-%Y %H:%M")
  end

  def created_at_with_text
    "#{I18n.t('post_show.asked')} #{object.created_at.strftime("%H:%M %d-%m-%Y")}"
  end

  def tag_of_post
    "[#{object.tags.first.tag_name}]"
  end

  def show_post_with_style
    " (#{I18n.t('home_index.rating')}: #{object.rating})"
  end
end
