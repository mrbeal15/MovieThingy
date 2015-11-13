require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let!(:review) {Review.create!(title: "awesome movie", content: "This movie was super awesome", photography: 5, directing: 5, cast: 5, score: 5, overall_effect:5)}
  let!(:movie) {Movie.create!(id: 1, title: "Skyfall", director: "Sam Mendes", release_year: 2012, runtime: 143, mppa_rating: "PG13", cast: "Daniel Craig, Javier Bardem, Ralph Fiennes, Judi Dench")}

  describe 'Get #index' do
    it "assigns all movies as @users" do
      get :index, { :movie_id => 1 }
      expect(assigns(:reviews)).to eq(Review.all)
    end
  end

end
