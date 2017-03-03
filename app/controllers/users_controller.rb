class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
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
    params
      .require(:user)
      .permit(
        :fisrt_name,
        :last_name,
        :picture,
        :email,
        :password,
        :password_confirmation,
        :phone_number,
        :civility,
        :address,
        :post_code,
        :city,
        :country
      )
  end
end
