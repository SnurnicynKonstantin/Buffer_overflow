class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def after_update_path_for(user)
    user_shot_path(user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :surname,:nick, :email, :avatar, :password, :password_confirmation)
  end
end