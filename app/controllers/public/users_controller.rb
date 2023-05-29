class Public::UsersController < ApplicationController



  def show
    @user = User.find(params[:id])
    if @user.private_setting = true && @user != current_user
      respond_to do |format|
        format.html { redirect_to users_path, notice:'このユーザーは非公開のためアクセスできません' }
      end
    end
    @posts = @user.posts.order(created_at: :desc)
  end

  def index
    @users = User.where.not(id: current_user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
    @user = current_user
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
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def search
    if params[:keyword].present?
      @users = User.where('name LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @users = User.all
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :birth_of_date, :private_setting, :comment)
  end
end