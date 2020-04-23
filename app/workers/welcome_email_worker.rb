class WelcomeEmailWorker
	include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(name, email)
    puts "Sending the welcome email to #{name} at #{email}!"
    ApplicationMailer.welcome_email(email).deliver
  end

end