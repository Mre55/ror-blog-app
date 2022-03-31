class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post_id: @post.id)
    @like.post = @post

    if @like.save
      redirect_to user_post_path(@user, @like)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
