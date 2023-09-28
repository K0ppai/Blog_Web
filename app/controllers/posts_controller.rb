class PostsController < ApplicationController
  def index
    @user = User.find(
      params[:user_id]
    )
    @posts = @user.posts
  end

  def show
    @post = Post.find(
      params[:id]
    )
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new
    end
  end
end
