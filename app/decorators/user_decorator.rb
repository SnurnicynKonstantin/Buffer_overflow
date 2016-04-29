class UserDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%H:%M %d-%m-%Y")
  end

  def user_change
    "Изменение: #{object.nick}"
  end

  def statistic_activity
    Tag.joins(:posts).where(posts: {id: object.posts.pluck(:id)}).group(:tag_name).count
  end

  def current_user_admin?
    object.exist? && object.admin?
  end

  def is_moderator? (post)
    (object.admin?) || (object.moderator? && object.tags.include?(post.tags.first))
  end
end
