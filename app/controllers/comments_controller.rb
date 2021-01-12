class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to fashion_path(@comment.fashion)
    else
      @fashion = @comment.fashion
      @comments = @fashion.comments
      render "fashions/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, fashion_id: params[:fashion_id])
  end
end
