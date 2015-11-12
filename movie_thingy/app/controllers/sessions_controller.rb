class SessionsController < ApplicationController
	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate()
			session[:current_user_id] = @user.id
			redirect_to "/"
		else
			@error = "Invalid credentials"
			render #...
		end
	end

  def destroy
    session.clear(:user_id)
    redirect_to "/"
  end

end