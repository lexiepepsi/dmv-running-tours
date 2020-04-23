class ApplicationMailer < ActionMailer::Base
  default from: 'alexakovachevich12@gmail.com'
  # layout 'mailer'

  def welcome_email(email)
  	# @name = name
  	@email = email
  	mail(to: @email, subject: 'Welcome to DMV Running Tours')
  end
end
