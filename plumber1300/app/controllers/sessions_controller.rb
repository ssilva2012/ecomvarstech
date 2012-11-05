class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by_email(params[:email])
	if user and user.authenticate(params[:password])
		session[:user_name] = user.lastName
    session[:email] = user.email
		redirect_to home_path
	else
		redirect_to '/login', alert: "Invalid user/password combination"
	end
  end

  def destroy
    logger.debug("1300 HITS logout")
  	session[:user_name] = nil
    session[:cart_postcodes] =  nil
  	redirect_to home_path, notice: "Logged out"
  end

  def current_user=(user)
  	@current_user = user
  end
end
