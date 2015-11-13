require 'rails_helper'

feature "User writing review" do

  scenario "Can submit review" do
  movie = Movie.new(title: "Skyfall", director: "Sam Mendes", release_year: 2012, runtime: 143, mppa_rating: "PG13", cast: "Daniel Craig, Javier Bardem, Ralph Fiennes, Judi Dench")
  movie.save
    review_number = Review.all.count
    visit '/login'
    find('#user_email').set 'bnfallon@yahoo.com'
    find('#user_password').set 'password'
    click_button 'Log in'
    visit "/movies/#{movie.id}/reviews/new"
    fill_in 'review[title]', with: "This was awesome"
    fill_in 'review[content]', with: "This was awesome"
    fill_in 'review[photography]', with: 5
    fill_in 'review[directing]', with: 5
    fill_in 'review[cast]', with: 5
    fill_in 'review[score]', with: 5
    fill_in 'review[overall_effect]', with: 5
    click_button 'Create Review'
    expect(Review.all.count).to be > review_number
    end
  end
