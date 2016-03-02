class LocationPageMailer < ApplicationMailer
  default from: 'notifications@example.com'
   
  def welcome_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject: 'Lead Form')
  end
end
