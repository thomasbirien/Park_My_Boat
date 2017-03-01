class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:fisrt_name, :last_name, :picture, :email, :password, :password_confirmation, :phone_number, :civility, :address, :post_code, :city, :country)
  end
end
