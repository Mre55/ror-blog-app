class UsersController < ApplicationController
  def index
    @shown_users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out
      redirect_to root_path
    else
      @shown_user = User.find(params[:id])
      @recent_posts = @shown_user.three_recent_posts
    end
  end
end
