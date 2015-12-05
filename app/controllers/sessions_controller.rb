class SessionsController < ApplicationController

	def login
	end

	def create
		user = User.find_by_email(params[:email])
		if user
		  if user.password == params[:password] 
		    session[:id] = user.id
		    flash[:success] = "logged in"
		    redirect_to root_url
		  else
		  	flash[:danger] = "Email or password is incorrect"
		  	redirect_to root_url
		  end
		else
		  flash[:danger] = "Email or password is incorrect"
		  redirect_to root_url
		end
	end

	def logout
		session[:id] = nil 
		flash[:success] = "logged out"
		redirect_to root_url
	end

end