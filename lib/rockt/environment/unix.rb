module Rockt
  module Environment
    module UNIX
      extend Rockt::Environment

      def self.commands
        ['xdg-open']
      end

      def self.regex
        /(linux|bsd|aix|solaris)/i
      end
    end
  end
end