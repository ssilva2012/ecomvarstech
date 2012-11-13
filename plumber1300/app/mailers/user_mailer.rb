class UserMailer < ActionMailer::Base
  default from: "1300 PLUMBER <vastechmailservice@gmail.com>"

  def registration_confirmation(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.email} <#{user.email}>", :subject => "Registered on 1300 PLUMBER")
  end

  def reset_password(user, randomString)
    @user = user
    @randomString = randomString
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.email} <#{user.email}>", :subject => "Reset password on 1300 PLUMBER")
  end

  def change_password(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.email} <#{user.email}>", :subject => "1300 PLUMBER password change")
  end
  
  def express_intrest(user, postcodeList)
    @user = user
    @postcodeList = postcodeList
    mail(:to => "#{user.email} <#{user.email}>", :subject => "Thank you for Express of Intrest to 1300 PLUMBER")
  end

  def intrest_plumber(user, postcodeList)
    @user = user
    @postcodeList = postcodeList
    mail(:to => "1300plumberuat@gmail.com", :subject => "Express of Intrest from plumber #{user.email}")
  end

  def customer_feedback(feedback)
    @feedback = feedback
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "1300plumberuat@gmail.com", :subject => "Feedback Received from #{feedback.custName}")
  end

  def upload_documents(uploadFiles1, uploadFiles2, uploadFiles3, emailAddress)
    indexNo = 0
    mail.attachments["ins"] = uploadFiles1.read 
    mail.attachments["pli"] = uploadFiles2.read 
    mail.attachments["plu"] = uploadFiles3.read 
    mail(:to => "ngcssilva@gmail.com", :subject => "Upload File Received from USER")
  end
end
