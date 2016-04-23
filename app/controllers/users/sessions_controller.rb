class Users::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(user)
    user_shot_path(user)
  end

end