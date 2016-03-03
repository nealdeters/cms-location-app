class LocationPageMailer < ApplicationMailer
  default from: 'notifications@example.com'
   
  def welcome_email(name, email, body, location_email)
    @name = name
    @email = email
    @body = body
    @location_email = location_email

    mail(to: ENV['GMAIL_USERNAME'], bcc: @location_email ,from: email, subject: 'Lead Form')
  end
end
