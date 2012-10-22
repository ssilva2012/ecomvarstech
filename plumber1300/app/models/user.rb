class User < ActiveRecord::Base
	attr_accessible :email, :userType, :remember, :enabled, :reset, :password, :password_confirmation, :firstName, :lastName, :title, :company, :address, :state, :postcode, :officePhone, :mobile, :licensed, :insured, :efficient, :howFind
	has_secure_password
end
