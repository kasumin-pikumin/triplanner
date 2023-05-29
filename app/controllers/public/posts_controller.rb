class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @plans = @post.plans

    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!
    PostPlan.create!(post_id: @post.id, plan_id: params[:post][:plan_id].to_i)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def search
    if params[:keyword].present?
      @posts = Post.where("report LIKE ? OR title LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  private

  def post_params
    params.require(:post)
    .permit(:title, :image, :night, :person, :day, :person, :report, plans_attributes: [:post_id])
  end

end