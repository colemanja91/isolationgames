# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |_repo| 'https://github.com/colemanja91/isolationgames.git' }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

gem 'aasm'
gem 'activerecord-postgis-adapter'
gem 'activerecord-session_store'
gem 'asset_sync'
gem 'aws-sdk-s3'
gem 'aws-sdk-sns'
gem 'devise'
gem 'fog-aws'
gem 'graphql'
gem 'haikunator'
gem 'hiredis'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'react-rails'
gem 'redis'
gem 'webpacker'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'spring'
end

group :development do
  gem 'graphiql-rails'
  gem 'guard-rspec'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-deep-ignore-order-matcher'
  gem 'rspec_junit_formatter'
end
