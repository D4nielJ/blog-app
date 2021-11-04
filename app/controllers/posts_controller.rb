class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @limit = params[:limit] unless params[:limit].nil?
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(posts_params)

    if @post
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
