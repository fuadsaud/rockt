module Rockt
  module Environment
    module Cygwin
      extend Rockt::Environment

      def self.open
        ['cmd /C start /b']
      end

      def self.regex
        /cygwin/i
      end
    end
  end
end