# frozen_string_literal: true

source "https://rubygems.org"

gem "rails", "~> 5"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "haml", ">= 5.0.4"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "therubyracer", platforms: :ruby
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "hamlit-rails"
gem "decent_exposure"
gem "devise", ">= 4.4.0"
gem 'jquery-rails'
gem 'bootstrap', '~> 4.1.1'
gem 'simple_form'
gem 'validates_timeliness'
gem "dotenv-rails"


group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "binding_of_caller"
  gem "letter_opener"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "html2haml"
end

group :development do
  gem 'capistrano', '~> 3.8', require: false
  gem 'capistrano-rails', '~> 1.2', require: false
  gem 'capistrano-rbenv', '~> 2.1', require: false
  gem 'capistrano-bundler', '~> 1.2', require: false
  gem 'capistrano3-puma', require: false
  gem 'rbnacl-libsodium'
  gem 'rbnacl', '< 5.0'
  gem 'bcrypt_pbkdf'
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "bullet"
  gem "rubocop", require: false
end

group :test do
  gem "database_cleaner"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
