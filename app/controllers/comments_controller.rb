class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: [ :edit, :destroy ]

  def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new
    end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      @user = User.find(@comment.user_id)
      if @comment.save
        flash[:notice] = "Thanks for your comment!"
        respond_to do |format|
          format.html {redirect_to post_path(@comment.post)}
          format.js
        end
      else
        flash[:alert] = "Oops, something went wrong!"
        redirect_to post_path(@comment.post)
      end
    end

    def edit
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

    def update
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if @comment.update(comment_params)
        flash[:notice] = "Comment successfully updated!"
        redirect_to post_path(@comment.post)
      else
        flash[:alert] = "Oops, something went wrong!"
        render :edit
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(@comment.post)
    end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end

    def require_permission
      if current_user != Comment.find(params[:id]).user
        flash[:alert] = "Whoops! Only the comment's author can edit or delete a comment."
        redirect_to post_path(Post.find(params[:post_id]))
      end
    end
end
