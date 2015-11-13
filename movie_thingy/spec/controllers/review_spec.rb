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

  describe 'GET #show' do
    it "assigns the requested review as @review" do
      get :show, { movie_id: 1, id: review.to_param }
      expect(assigns(:review)).to eq(review)
    end
  end

  describe 'GET #new' do
    it 'renders the new form' do
      get :new, { :movie_id => 1 }
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context "when valid params are passed" do

      it 'creates a new review' do
        expect{
          post :create, { movie_id: 1, review: {title: "awesome movie", content: "This movie was super awesome", photography: 5, directing: 5, cast: 5, score: 5, overall_effect:5}
        }}.to change(Review, :count).by(1)
      end

      it 'redirects to the movie page after creation' do
        expect(
          post :create, { movie_id: 1, review: {title: "awesome movie", content: "This movie was super awesome", photography: 5, directing: 5, cast: 5, score: 5, overall_effect:5}
        }).to redirect_to("/movies/#{assigns(:movie).id}")
      end
    end
  end


end
