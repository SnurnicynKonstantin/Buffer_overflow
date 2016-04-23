class UsersController < ApplicationController
  before_action :set_user

  def show
    authorize current_user
  end

  def edit
    flash[:error] = nil
  end

  def update
    if @user.update(user_params)
      sign_in_and_redirect @user
    else
      flash[:error] = @user.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

    def set_user
      @user = User.friendly.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nick, :email, :name,
                                   :surname, :avatar, :password,
                                   :password_confirmation)
    end

end