class CommentsController < ApplicationController
  def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new
    end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      if @comment.save
        flash[:notice] = "Thanks for your comment!"
        redirect_to post_path(@comment.post)
      else
        flash[:alert] = "Oops, something went wrong!"
        render :new
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
      params.require(:comment).permit(:author, :content, :post_id)
    end
end
