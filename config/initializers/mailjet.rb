require 'mailjet'
require 'dotenv'
Dotenv.load

Mailjet.configure do |config|
  config.api_key = ENV['API_PUBLIC_KEY']
  config.secret_key = ENV['API_SECRET_KEY']
  config.default_from = ENV["MAIL_ADDRESS"]
end