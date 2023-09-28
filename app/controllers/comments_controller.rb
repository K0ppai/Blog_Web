class CommentsController < ApplicationController
  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    comment.author = current_user
    comment.post = post

    flash[:alert] = 'Please type something before adding new comment' unless comment.save
    redirect_to user_post_path(user_id: user, id: post)
  end
end
