class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    comment.author = current_user
    comment.post = post

    flash[:alert] = 'Please type something before adding new comment' unless comment.save
    redirect_to user_post_path(user_id: user, id: post)
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post

    post.decrement!(:comments_counter)
    comment.destroy
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), notice: 'Comment deleted successfully!'
  end
end
