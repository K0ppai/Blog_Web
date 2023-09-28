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

    if comment.save
      redirect_to user_post_path(user_id: user, id: post)
    else
      render :new
    end
  end
end
