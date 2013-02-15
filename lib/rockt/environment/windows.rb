module Rockt
  module Environment
    module Windows
      def self.commands
        ['start']
      end

      def self.regex
        /(mingw|mswin|windows)/i
      end
    end
  end
end