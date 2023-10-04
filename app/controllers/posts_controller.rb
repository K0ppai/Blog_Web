class PostsController < ApplicationController
  load_and_authorize_resource

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
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_path(id: current_user)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.author.decrement!(:post_counter)
    @post.destroy
    redirect_to user_posts_path(user_id: @post.author)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
