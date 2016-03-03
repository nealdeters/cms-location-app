class ContactEmailMailer < ApplicationMailer
  default from: 'notifications@example.com'
   
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(to: ENV['GMAIL_USERNAME'], from: email, subject: 'Nearr.Me Contact Form')
  end
end