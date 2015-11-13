class PagesController < ApplicationController
	def index
		@top_reviews = Review.order('score desc')[0..2]
	end
end