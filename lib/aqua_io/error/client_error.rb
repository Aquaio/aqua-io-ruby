module AquaIo

  module Error

    class ClientError < ::StandardError

      attr_reader :code

      def initialize(message, code)
        @code = code
        super message
      end

    end

  end

end
