class PostsController < ApplicationController
  def index
    @user = Users.find(
    params[:user_id]
    )
    @posts = @user.posts
  end

  def show;
    @user = Users.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
