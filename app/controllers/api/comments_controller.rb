class Api::CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:post_id])
    @comments = @posts.comments
    render json: @comments
  end

  # def new; end

  # def create
  #   @current_user = current_user
  #   @user = User.find(params[:user_id])
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new(comments_params)
  #   @comment.post = @post
  #   @comment.author = @current_user

  #   flash[:error] = @comment.errors.messages unless @comment.save
  #   redirect_to user_post_path(@user, @post)
  # end

  # def destroy
  #   @user = User.find(params[:user_id])
  #   @post = @user.posts.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   @comment.destroy
  #   flash[:notice] = 'Comment deleted succesfully'
  #   redirect_to user_post_path(@user, @post)
  # end

  # private

  # def comments_params
  #   params.require(:comment).permit(:text)
  # end
end
