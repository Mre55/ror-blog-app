class CommentsController < ApplicationController
  def new; end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comments_params)
    @comment.post = @post

    if @comment.save
      flash[:notice] = 'Comment was successfully created'
    else
      flash[:alert] = @comment.errors.messages
    end
    redirect_to user_post_path(@user, @post)
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
