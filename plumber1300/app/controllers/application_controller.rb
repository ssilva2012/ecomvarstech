class ApplicationController < ActionController::Base
  protect_from_forgery

  private
	def current_cart
		if session[:cart_id]
			session[:cart_id] = 3
		end
	end
end
