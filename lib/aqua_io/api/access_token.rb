module AquaIo

  module Api

    # Retrieve access token using API credentials.
    class AccessToken

      def initialize(client)
        @client = client
      end

      # Returns an access token (required for making all other API calls).
      #
      # 'oauth/token?grant_type=client_credentials' POST
      def retrieve(options = {})
        body = options.fetch(:body, {})

        @client.post("oauth/token?grant_type=client_credentials", body, options)
      end

    end

  end

end
