class CommentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_user, only: [:create]
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to user_post_path(@post.author, @post)
    else
      flash[:alert] = 'Something went wrong Comment was not created.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @post.author
    @comment.destroy
    @post.comments_counter -= 1

    redirect_to user_post_path(@user, @post) if @post.save
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end

  def new
    @comment = Comment.new
    @current_user = current_user
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
