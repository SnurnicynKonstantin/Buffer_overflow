class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless current_user
    @current_user = current_user
    @user = user
  end

  def show?
    current_user
  end

  def edit?
    current_user && current_user.admin?
  end

  def update?
    current_user && current_user.admin?
  end

  def destroy?
    current_user && current_user.admin?
  end
end