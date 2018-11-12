require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

Dotenv::Railtie.load
module GetYourPlane
  class Application < Rails::Application
  	config.action_mailer.delivery_method = :mailjet
    config.action_mailer.smtp_settings = {
              :address => "in-v3.mailjet.com",
              :enable_starttls_auto => true,
              :port => 465,
              :authentication => 'plain',
              :user_name => ENV["API_PUBLIC_KEY"],
              :password => ENV["API_SECRET_KEY"]
            }
  	# config.action_mailer.delivery_method = :mailjet_api
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
