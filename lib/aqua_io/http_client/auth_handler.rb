require "base64"

module AquaIo

  module HttpClient

    # AuthHandler takes care of devising the auth type and using it
    class AuthHandler < Faraday::Middleware

      URL_SECRET = 2
      URL_TOKEN = 3

      def initialize(app, auth = {}, options = {})
        @auth = auth
        super(app)
      end

      def call(env)
        if !@auth.empty?
          auth = get_auth_type
          flag = false

          if auth == URL_SECRET
            env = url_secret(env)
            flag = true
          end

          if auth == URL_TOKEN
            env = url_token(env)
            flag = true
          end

          if !flag
            raise StandardError.new "Unable to calculate authorization method. Please check"
          end
        end

        @app.call(env)
      end

      # Calculating the Authentication Type
      def get_auth_type()

        if @auth.has_key?(:client_id) and @auth.has_key?(:client_secret)
          return URL_SECRET
        end

        if @auth.has_key?(:access_token)
          return URL_TOKEN
        end

        return -1
      end

      # OAUTH2 Authorization with client secret
      def url_secret(env)
        query = {
          :client_id => @auth[:client_id],
          :client_secret => @auth[:client_secret]
        }

        merge_query(env, query)
      end

      # OAUTH2 Authorization with access token
      def url_token(env)
        query = { :access_token => @auth[:access_token] }

        merge_query(env, query)
      end

      def query_params(url)
        if url.query.nil? or url.query.empty?
          {}
        else
          Faraday::Utils.parse_query(url.query)
        end
      end

      def merge_query(env, query)
        query = query.update query_params(env[:url])

        env[:url].query = Faraday::Utils.build_query(query)

        return env
      end
    end

  end

end
