class ReviewsController < ApplicationController

  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_movie

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.save
    redirect_to "/movies/#{@movie.id}"
  end

  def edit
  end

  def update
    @review.update_attributes(review_params)
  end

  def destroy
    @post.destory
    redirect_to root_path
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :photography, :directing, :cast, :score, :overall_effecty, :photo_1, :photo_2, :photo_3, :photo_4, :photo_5)
  end
end
