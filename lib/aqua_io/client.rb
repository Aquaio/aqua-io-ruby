require "faraday"
require "json"

require "aqua_io/api/access_token"
require "aqua_io/api/icd9"
require "aqua_io/api/icd10"

module AquaIo

  class Client

    def initialize(auth = {}, options = {})
      @http_client = AquaIo::HttpClient::HttpClient.new(auth, options)
    end

    # Retrieve access token using API credentials.
    def access_token()
      AquaIo::Api::AccessToken.new(@http_client)
    end

    # Returns an ICD-9 code.
    def icd9()
      AquaIo::Api::Icd9.new(@http_client)
    end

    # Returns an ICD-10 code.
    def icd10()
      AquaIo::Api::Icd10.new(@http_client)
    end

  end

end
