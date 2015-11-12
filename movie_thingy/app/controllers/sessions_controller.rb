class SessionsController < ApplicationController
	# get '/login'
	def new
		@user = User.new
	end

	# post '/login'
	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:current_user_id] = @user.id
			redirect_to "/"
		else
			@error = "Invalid credentials"
			render :new
		end
	end

	# delete '/logout'
  def destroy
    session.clear(:user_id)
    redirect_to "/"
  end

end