module Rockt
  module Environment
    module OSX
      def self.commands
        ['open']
      end

      def self.regex
        /(darwin|mac os)/i
      end
    end
  end
end