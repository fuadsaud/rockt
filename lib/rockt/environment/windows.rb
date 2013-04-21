module Rockt
  module Environment
    module Windows
      extend Rockt::Environment

      def self.open
        ['start']
      end

      def self.regex
        /(mingw|mswin|windows)/i
      end
    end
  end
end