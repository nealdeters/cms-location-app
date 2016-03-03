class LocationPageMailer < ApplicationMailer
  default from: 'notifications@example.com'
   
  def welcome_email(name, email, body, location_email)
    @name = name
    @email = email
    @body = body
    @location_email = location_email

    mail(to: @location_email, from: ENV['GMAIL_USERNAME'], subject: 'Locations CMS Lead Form')
  end
end
