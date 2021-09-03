class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/courts/#{comment.court.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, court_id: params[:court_id])
  end
end