# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  Rails.application.config.session_store :cache_store, key: '_isolationgames_session', domain: 'localhost'
elsif Rails.env.production?
  Rails.application.config.session_store :cache_store, key: '_isolationgames_session'
end
