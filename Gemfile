source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'gravatar_image_tag'
gem 'abracadabra', git: 'https://github.com/melvinchng/abracadabra.git'
gem 'cocoon'

# Frontend input masks
gem 'jquery-inputmask-rails'

# Unique Hash
gem 'hashids'
gem 'rqrcode'

# Google Map
gem 'geocoder'
gem 'gmaps4rails'

# Controller-JS Link
gem 'gon'

# Calendar
gem 'simple_calendar', '~> 2.0'

# Payment
gem 'stripe'

# Meterialize
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
gem 'materialize-sass'
gem 'material_icons'

# User backend  
gem 'devise'

# Avatar for user profile
gem "paperclip", "~> 5.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', platforms: :ruby

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do  
  gem 'pg'  
  gem 'rails_12factor'  
  gem 'dalli'  
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rails_db'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Peformance Information
gem 'rack-mini-profiler'