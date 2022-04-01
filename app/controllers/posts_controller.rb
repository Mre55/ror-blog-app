class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts_with_comments = @user.posts.map { |post| { post: post, comments: post.five_recent_comments } }
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.commentsCounter = 0
    @post.likesCounter = 0

    if @post.save
      flash[:notice] = 'Post was successfully created'
    else
      flash[:alert] = @post.errors.messages
    end
    redirect_to user_post_path(@user, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
