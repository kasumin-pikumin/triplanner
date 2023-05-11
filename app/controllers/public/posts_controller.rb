class Public::PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!
    redirect_to post_path(@post.id)
  end

  def edit
  end

  def search
  end

  private

  def post_params
    params.require(:post).permit(:plan_id, :title, :image, :night, :person, :day, :person, :report)
  end
end
