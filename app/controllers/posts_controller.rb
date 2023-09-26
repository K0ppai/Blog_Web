class PostsController < ApplicationController
  def index
    @user = User.find(
      params[:user_id]
    )
    @posts = @user.posts
  end

  def show
    puts params
  end
end
