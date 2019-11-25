source 'https://rubygems.org'

ruby '2.6.5'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'bcrypt'
gem 'jwt'

group :development do
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'pry', '~> 0.12.2'
  gem 'dotenv', '~> 2.4'
  gem 'database_cleaner'
end

group :test do
  gem 'rspec'
end
