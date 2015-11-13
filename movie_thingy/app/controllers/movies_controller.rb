class MoviesController < ApplicationController


  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.new
  end

	def create
    @movie = Movie.create( movie_params )
    redirect_to "/movies/#{@movie.id}"
  end

  def edit
  end

  def update
    @movie.update_attributes(movie_params)
  end

  def destory
    @movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title_photo, :title, :director, :release_year, :runtime, :mppa_rating, :cast, :genre_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
