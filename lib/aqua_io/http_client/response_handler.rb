module AquaIo

  module HttpClient

    # ResponseHandler takes care of decoding the response body into suitable type
    class ResponseHandler

      def self.get_body(response)
        type = response.response_headers["content-type"]
        body = response.body

        # Response body is in JSON
        if type && type.include?("json")
          body = JSON.parse body
        end

        return body
      end

    end

  end

end
