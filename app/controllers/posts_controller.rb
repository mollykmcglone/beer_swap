class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.category_id = 1
    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops, there were errors, please try again:"
      render :new
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :author, :content)
  end
end
