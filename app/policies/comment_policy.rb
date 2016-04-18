class CommentPolicy
  attr_reader :user, :post

  def initialize(user, post)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
    @post = post
  end

  def create?
    user
  end

  def vote_up?
    user
  end
end