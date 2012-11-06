class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
    if(params[:forgot])
      if user
        o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
        randomString  =  (0...8).map{ o[rand(o.length)] }.join
        user.reset = 1
        user.password = randomString
        if user.save
          UserMailer.reset_password(user, randomString).deliver
          respond_to do |format|
            format.html { redirect_to login_path, notice: "Email with reset instruction is sent to #{user.email}" }
          end
        else
          respond_to do |format|
            format.html { redirect_to login_path, notice: "Error on user login" }
          end
        end
      else 
        respond_to do |format|
          format.html { redirect_to login_path }
          format.json { head :no_content }
        end
      end
    else
    	if user and user.authenticate(params[:password])
    		session[:user_name] = user.lastName
        session[:email] = user.email
        if user.reset == 1
          render "updatepassword"
        else
          if session[:cart_postcodes]
      		  redirect_to findPostcode_path
          else 
            redirect_to static_pages_plumbersection_path
          end
        end
    	else
    		redirect_to '/login', alert: "Invalid user/password combination"
    	end
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

  def changepassword
    user = User.find_by_email(session[:email])
    if user and user.authenticate(params[:oldpassword]) and params[:password] == params[:password_confirmation] 
      user.password = params[:password]
      user.reset = 0
      if user.save
        UserMailer.change_password(user).deliver
        if session[:cart_postcodes]
          redirect_to findPostcode_path
        else 
          redirect_to static_pages_plumbersection_path
        end
      else
        render "updatepassword", notice: 'Password change unsuccessful. Try again.'
      end
    else
      render "updatepassword", notice: 'Password change unsuccessful. Try again.'
    end
  end
end
