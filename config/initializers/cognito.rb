# frozen_string_literal: true

require 'cognito_jwt_keys'
require 'cognito_urls'

if Rails.env.production?
  CognitoUrls.init(
    Rails.application.credentials.cognito[:domain],
    Rails.application.credentials.cognito[:region]
  )

  CognitoJwtKeysProvider.init
end
