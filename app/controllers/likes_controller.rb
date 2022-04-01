class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post_id: @post.id)
    @like.post = @post

    if @like.save
      flash[:notice] = 'You successfully like this post'
    else
      flash[:alert] = @like.errors.messages
    end
    redirect_to user_post_path(@user, @like)
  end
end
