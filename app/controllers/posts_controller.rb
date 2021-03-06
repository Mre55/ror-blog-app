class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts_with_comments = @user.posts.map { |post| { post:, comments: post.five_recent_comments } }
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.commentsCounter = 0
    @post.likesCounter = 0

    if @post.save
      flash[:notice] = 'Post was successfully created'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:alert] = @post.errors.messages
      render :new, status: :unprocessable_entity
    end
  end

  def like
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @like = current_user.likes.new(post_id: @post.id)

    if @like.save
      flash[:notice] = 'You successfully like this post'
    else
      render :new, status: :unprocessable_entity
    end
    redirect_to user_post_path(@user, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
