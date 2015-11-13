require 'rails_helper'

feature "User signing up" do

  scenario "User can find sign up page" do
    visit '/'
    click_link('Sign Up')
    expect(page).to have_content 'Register'
  end

  scenario "User can create new user with vaild credentials" do
    user_number = User.all.count
    visit '/signup'
    fill_in 'user[username]', with: 'Salt7900'
    fill_in 'user[email]', with: 'bnfallon@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Create Account'
    expect(User.all.count).to be > user_number
  end

end

feature "User logging in" do
  User.create(username: 'Salt7800', email: 'bnfallon@yahoo.com', password: 'password')

  scenario "User can find login page" do
    visit '/'
    click_link('Sign In')
    expect(page).to have_content 'Log In'
  end

  scenario "User can log in" do
    visit '/login'
    fill_in 'email', with: 'bnfallon@yahoo.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Salt7800'
  end

  scenario "Can't login with invalid credentials" do
    visit '/login'
    fill_in 'email', with: 'Hi!'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Invalid credentials'
  end
end
