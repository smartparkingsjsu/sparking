# Load the Rails application.
require_relative 'application'

# Devise config
Rails.application.routes.default_url_options[:host] = 'localhost:3000'

# Initialize the Rails application.
Rails.application.initialize!
