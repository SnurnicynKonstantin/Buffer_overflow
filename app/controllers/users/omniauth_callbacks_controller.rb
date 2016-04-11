class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    @user = User.find_for_oauth(request.env['omniauth.auth'], current_user)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :twitter,  :all
  alias_method :github,   :all

  def failure
    redirect_to root_path
  end

end