class CommentsController < ApplicationController
  def new; end

  def create
    @current_user = current_user
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comments_params)
    @comment.post = @post
    @comment.author = @current_user

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render user_post_path(@user, @post)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
