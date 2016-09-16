class PostsController < ApplicationController
  before_action :ensure_admin!, except: [ :index, :show ]

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :author, :content, :category_id, :image)
  end


  def ensure_admin!
    unless current_user.admin?

      redirect_to root_path

      return false
    end
  end
end
