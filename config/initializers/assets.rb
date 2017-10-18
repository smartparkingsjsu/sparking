# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# stylesheet and js
Rails.application.config.assets.precompile += %w( users.js users.css )
Rails.application.config.assets.precompile += %w( users_reservation.js )
Rails.application.config.assets.precompile += %w( home.js home.css )
Rails.application.config.assets.precompile += %w( dashboard.js dashboard.css )
Rails.application.config.assets.precompile += %w( reservation_partial.js reservation_partial.css )
Rails.application.config.assets.precompile += %w( notifications.js )