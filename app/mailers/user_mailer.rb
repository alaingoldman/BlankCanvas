class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  
  def warning(email)
      mail(to: email, from: "alain.goldman@gmail.com", subject: "Warning!")
  end
  
end
