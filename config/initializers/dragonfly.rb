require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "f2a2631bc3f45652c7c6fdf1f65f0920a9516319d46d43f7d42a5e832ef51c13"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end


# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
