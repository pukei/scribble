class CommentsController < ApplicationController
  def create
    scribble = Scribble.friendly.find(params[:scribble_id])
    scribble.comments.create(comment_params)
    redirect_to scribble_path(scribble, { comments: 'true' }) + '#comments'
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:commentator, :email, :comment)
  end
end
