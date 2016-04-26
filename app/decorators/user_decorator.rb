class UserDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%H:%M %d-%m-%Y")
  end

  def statistic_activity
    tags = []
    object.posts.each do |post|
      tags << post.tags.first
    end
    tag_count = {}
    tags.group_by(&:tag_name).each { |k, v| tag_count[k] = v.length }
    tag_count
  end

end
