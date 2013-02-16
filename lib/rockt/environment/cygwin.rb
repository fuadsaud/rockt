module Rockt
  module Environment
    module Cygwin
      extend Rockt::Environment

      def self.commands
        ['cmd /C start /b']
      end

      def self.regex
        /cygwin/i
      end
    end
  end
end