source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'bcrypt'
gem 'jwt'
gem 'warden'
gem 'pundit'
gem 'pusher'

group :development do
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'pry', '~> 0.12.2'
  gem 'dotenv', '~> 2.4'
  gem 'rspec_api_documentation'
end

group :test do
  gem 'rspec'
  gem 'database_cleaner'
  gem 'rack-test'
  gem 'simplecov', require: false
end
