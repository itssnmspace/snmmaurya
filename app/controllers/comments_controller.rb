class CommentsController < ApplicationController
  before_action :set_blog

  def new

  end

  def create
    @comment = Comment.new comments_params
    @comment.blog_id = @blog.id
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Success"
      redirect_to blog_path(@blog)
    else
      flash[:error] = "Unable to process #{@comment.errors.full_messages.join(', ')}"
      redirect_to blog_path(@blog)
    end  
  end

  private
    def comments_params
      params.require(:comment).permit(:title, :description, :user_id, :blog_id)
    end

    def set_blog
      @blog = Blog.find params[:blog_id]
    end
end