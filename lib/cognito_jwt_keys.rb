require "cognito_urls"

class CognitoJwtKeysProvider
  class << self
    @jwt_keys = nil

    def init
      resp = Excon.get(CognitoUrls.jwks_uri)
      keys = JSON.parse(resp.body)
      keymap = Hash[keys["keys"].map {|key|
                      [key["kid"], JSON::JWK.new(key)]
                    }]
      @jwt_keys = CognitoJwtKeys.new(keymap)
    end

    def keys
      @jwt_keys
    end
  end
end

class CognitoJwtKeys
  def initialize(keymap)
    @keys = keymap
  end

  def get(key_id, alg = 'RS256')
    key = @keys[key_id]

    unless key
      raise "No such JWK `#{key_id}`: #{@keys.keys}"
    end

    unless key[:alg] == alg
      raise "Algorithm not compatible #{key[:alg]} != #{alg}"
    end

    key
  end
end
