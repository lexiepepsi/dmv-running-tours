# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'dmv-running-tours.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# 465 - for SSL
# 25, 587 - (for unencrypted/TLS connections)