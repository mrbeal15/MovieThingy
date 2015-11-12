class UsersController < ApplicationController
	# get '/signup'
	def new
		@user = User.new
	end

	def show
	end

	def edit
	end

	# post '/signup'
	def create
		@user = User.new(user_params)
		if @user.save
			session[:current_user_id] = @user.id
			flash[:success] = "Welcome to the Sample App!"
			redirect_to "/"
		else
			@error = "Invalid credentials"
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end