require 'rails_helper'

feature "User signing up" do

  scenario "User can find sign up page" do
    visit '/'
    click_link('Sign Up')
    expect(page).to have_content 'Register'
  end

  scenario "User can create new user" do
    user_number = User.all.count
    visit '/signup'
    fill_in 'user[username]', with: 'Salt7900'
    fill_in 'user[email]', with: 'bnfallon@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Create Account'
    expect(User.all.count).to be > user_number
  end

end
