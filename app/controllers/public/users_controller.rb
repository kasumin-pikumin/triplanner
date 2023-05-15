class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path(@user.id)
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会手続きが完了しました"
    redirect_to root_path
  end

  def favorite
  end

  def follow
  end

  def search
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :birth_of_date, :private_setting, :comment)
  end
end
