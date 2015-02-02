module AquaIo

  module Api

    # Returns an ICD-10 code.
    class Icd10

      def initialize(client)
        @client = client
      end

      # Returns all top-level ICD-10 codes. Useful for helping a user navigate down the ICD-10 hierarchy to find a code.
      #
      # 'codes/v1/icd10' GET
      def top_level_codes(options = {})
        body = options.fetch(:query, {})

        @client.get("codes/v1/icd10", body, options)
      end

      # Returns a single code matching the name, if any exists. Replace periods with hypens (e.g. 'R50-9' for 'R50.9')
      #
      # 'codes/v1/icd10/:code_name' GET
      #
      # code_name - name of code
      def single_code(code_name, options = {})
        body = options.fetch(:query, {})
        body[:code_name] = code_name

        @client.get("codes/v1/icd10/#{code_name}", body, options)
      end

      # Returns all codes whose name contains the search string.
      #
      # 'codes/v1/icd10?q[name_cont]=:query' GET
      #
      # query - the search query string
      def search_by_name(query, options = {})
        body = options.fetch(:query, {})
        body[:query] = query

        @client.get("codes/v1/icd10?q[name_cont]=#{query}", body, options)
      end

      # Returns all codes whose description contains the search string.
      #
      # 'codes/v1/icd10?q[description_cont]=:query' GET
      #
      # query - the search query string
      def search_by_description(query, options = {})
        body = options.fetch(:query, {})
        body[:query] = query

        @client.get("codes/v1/icd10?q[description_cont]=#{query}", body, options)
      end

      # Returns all codes whose name or description contains the search string.
      #
      # 'codes/v1/icd10?q[name_or_description_cont]=:query' GET
      #
      # query - the search query string
      def search_by_name_or_description(query, options = {})
        body = options.fetch(:query, {})
        body[:query] = query

        @client.get("codes/v1/icd10?q[name_or_description_cont]=#{query}", body, options)
      end

    end

  end

end
