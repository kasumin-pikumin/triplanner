class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @user = current_user
    @posts = @user.posts
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

  def favorites
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorites_posts = Post.find(@favorites)
  end

  def followings
    @user = current_user
    @users = user.followings
  end
  
  def followers
    @user = current_user
    @user = user.followers
  end  

  def search
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :birth_of_date, :private_setting, :comment)
  end
end
