class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @limit = params[:limit] unless params[:limit].nil?
  end

  def show
    @current_user = current_user
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(posts_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:notice] = 'Post published succesfully'
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = @post.errors.messages
      render :new
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
