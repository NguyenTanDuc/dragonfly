require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "f2a2631bc3f45652c7c6fdf1f65f0920a9516319d46d43f7d42a5e832ef51c13"

  url_format "/media/:job/:name"

  datastore :s3,
            bucket_name: ENV["BUCKET_NAME"],
            access_key_id: ENV["AWS_KEY_ID"],
            secret_access_key: ENV["SECRET_KEY"],
            region: "ap-southeast-1",
            url_scheme: 'https'
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
