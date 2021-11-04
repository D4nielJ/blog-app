class UsersController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.create(comments_params)
  end

  # def create
  #   @user = current_user
  #   @post = @user.posts.create(posts_params)

  #   if @post
  #     redirect_to user_post_path(@user, @post)
  #   else
  #     render :new
  #   end
  # end

  private

  def comments_params
    params.require(:comment).permit(:text, @user.id)
  end
end
