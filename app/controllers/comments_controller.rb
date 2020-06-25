class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.post, notice: 'Something wrong!'
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end
end
