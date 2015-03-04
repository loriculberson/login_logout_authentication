class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			flash[:errors] = "Invalid login."
			render :new
		end
	end

	def destroy 
		flash[:logout] = "Successfully logged out!"
		session[:user_id] = nil
		redirect_to login_path
	end
end