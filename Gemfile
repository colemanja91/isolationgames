source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/colemanja91/isolationgames.git' }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'aasm'
gem 'activerecord-postgis-adapter'
gem 'aws-sdk-s3'
gem 'aws-sdk-sqs'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'shoryuken'
gem 'twilio-ruby'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'spring'
end

group :development do
  gem 'guard-rspec'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
