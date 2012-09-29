class User < ActiveRecord::Base
	attr_accessible :email, :userType, :remember, :enabled, :reset
end
