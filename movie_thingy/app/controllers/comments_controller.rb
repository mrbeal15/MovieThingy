class CommentsController < ApplicationController
  before_action :find_review, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @review.comments << @comment
  end


  private

  def find_review
    @review = Review.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :review_id)
  end
end
