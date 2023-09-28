class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    author = User.find(params[:user_id])
    like = Like.new(author: current_user, post:)

    redirect_to user_post_path(user_id: author, id: post) if like.save
  end
end
