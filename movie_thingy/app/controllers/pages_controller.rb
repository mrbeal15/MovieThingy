class PagesController < ApplicationController
	
	def index
		@top_reviews = Review.order('score desc')[0..2]
		
		total = 0
	  avg_scores = []

	  @movies = Movie.all

		@movies.each do |m|
			m.reviews.each do |r|
				total += r.overall_effect
			end
			avg = total/m.reviews.count
			m.avg_score = avg
		end

		@top_movies = @movies.order('avg_score desc')[0..2]
	end

end