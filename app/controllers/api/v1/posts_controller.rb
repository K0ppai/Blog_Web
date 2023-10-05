class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(
      params[:user_id]
    )
    @posts = @user.posts
    render json: { success: true, data: @posts }
  end
end
