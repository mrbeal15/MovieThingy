require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) {User.create!(username: 'Salt7900', email: 'bnfallon@gmail.com', password: 'password')}

  

end
