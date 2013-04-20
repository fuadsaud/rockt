module Rockt
  module Environment
    module Darwin
      extend Rockt::Environment

      def self.commands
        ['open']
      end

      def self.regex
        /(darwin|mac os)/i
      end
    end
  end
end