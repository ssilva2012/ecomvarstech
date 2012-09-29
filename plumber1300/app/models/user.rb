class User < ActiveRecord::Base
	attr_accessible :email, :userType, :remember, :enabled, :reset, :password, :password_confirmation
	has_secure_password
end
