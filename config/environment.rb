# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'app77689467@heroku.com' , #ENV["SENDGRID_USERNAME"],
    :password => 'yv9rtyew2496' , #ENV["SENDGRID_PASSWORD"],
    :domain => 'yourdomain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}