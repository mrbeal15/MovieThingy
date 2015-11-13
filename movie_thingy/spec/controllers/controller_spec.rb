require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movie_1) {Movie.create!(title: "Skyfall", director: "Sam Mendes", release_year: 2012, runtime: 143, mppa_rating: "PG13", cast: "Daniel Craig, Javier Bardem, Ralph Fiennes, Judi Dench")}
  let!(:movie_2) {Movie.create!(title: "Frozen", director: "Chris Buck", release_year: 2013, runtime: 102, mppa_rating: "PG", cast: "Kristen Bell, Idina Menzel, Jonathan Groff")}

  describe 'Get #index' do
    it "assigns all movies as @movies" do
      get :index
      expect(assigns(:movies)).to eq(Movie.all)
    end
  end

  describe 'GET #show' do
    it "assigns the requested movie as @movie" do
      get :show, { id: movie_1.to_param }
      expect(assigns(:movie)).to eq(movie_1)
    end
  end

  describe 'GET #new' do
    it 'renders the a new form' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context "when valid params are passed" do

      it 'creates a new movie' do
        expect{
          post :create, movie: {title: "Skyfall", director: "Sam Mendes", release_year: 2012, runtime: 143, mppa_rating: "PG13", cast: "Daniel Craig, Javier Bardem, Ralph Fiennes, Judi Dench"}
        }.to change(Movie, :count).by(1)
      end

      it 'redirects to the movie page after creation' do
        expect(
          post :create, movie: {title: "Skyfall", director: "Sam Mendes", release_year: 2012, runtime: 143, mppa_rating: "PG13", cast: "Daniel Craig, Javier Bardem, Ralph Fiennes, Judi Dench"
        }).to redirect_to("/movies/#{assigns(:movie).id}")
      end
    end
  end


end
