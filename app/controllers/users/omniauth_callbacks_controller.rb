class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    omniauth = request.env['omniauth.auth']
    provider = Provider.where(provider: omniauth['provider'], uid: omniauth['uid']).take

    if provider
      sign_in_and_redirect User.find(provider.user_id)
    elsif current_user
      current_user.providers.create(provider: omniauth['provider'], uid: omniauth['uid'])
      sign_in_and_redirect current_user
    else
      user = (omniauth['info']['email'].present? && User.find_by(email: omniauth['info']['email']))
      user = User.new unless user
      user.apply_omniauth(omniauth)
      if user.save
        sign_in_and_redirect(:user, user)
      else
        redirect_to new_user_registration_path
      end
    end
  end

  alias_method :facebook, :all
  alias_method :twitter,  :all
  alias_method :github,   :all

  def failure
    redirect_to root_path
  end

end