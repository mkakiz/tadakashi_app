class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'Comment was posted'
      redirect_to post_path(comment.post_id)
    else
      redirect_to post_path(comment.post_id), flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.post, flash: { notice: 'Comment was deleted'}
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :name, :comment)
  end
end
