class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @limit = params[:limit] unless params[:limit].nil?
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new; end

  def create; end
end
