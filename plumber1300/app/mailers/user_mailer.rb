class UserMailer < ActionMailer::Base
  default from: "1300 PLUMBER <vastechmailservice@gmail.com>"
  def registration_confirmation(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.email} <#{user.email}>", :subject => "Registered on 1300 PLUMBER")
  end

  
  def express_intrest(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "vastechmailservice@gmail.com", :subject => "Express of Intrest from plumber #{user.email}")
  end
end
