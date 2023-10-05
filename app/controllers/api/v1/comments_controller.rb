class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: { success: true, data: comments }
  end

  def create
    post = Post.find(params[:post_id])
    author = current_user
    comment = Comment.new(author:, post:, text: comment_params)

    if comment.save
      render json: { success: true, data: comment }, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end