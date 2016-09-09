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
    @post.category_id = params[:post][:category_id].to_i
    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to posts_path
    else
      flash[:alert] = "Oops, something went wrong!"
      render :new
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :author, :content, :category_id)
  end
end
