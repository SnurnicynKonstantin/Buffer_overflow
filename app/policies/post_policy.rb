class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def new?
    user
  end

  def edit?
    user && ((user.admin?) || (user.moderator? && user.tags.include?(@post.tags.first)))
  end

  def update?
    user && ((user.admin?) || (user.moderator? && user.tags.include?(@post.tags.first)))
  end

  def show?
    true
  end

  def create?
    user
  end
end