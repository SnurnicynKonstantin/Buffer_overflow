class UsersController < ApplicationController
  before_action :set_user

  def show
    authorize User
    @title = @user.name
  end

  def edit
    authorize User
    @title = @user.user_change
  end

  def update
    authorize User
    if @user.update(user_params)
      sign_in_and_redirect @user
    else
      flash.now[:error] = @user.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    authorize User
    @user.destroy
    redirect_to root_url
  end

  private

    def set_user
      @user = User.friendly.find(params[:id]).decorate
    end

    def user_params
      params.require(:user).permit(:nick, :email, :name,
                                   :surname, :avatar, :password,
                                   :password_confirmation)
    end

end