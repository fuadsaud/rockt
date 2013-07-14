# encoding: utf-8

module Rockt
  module Environment

    # Represents general Unix environments - Linux, BSD, Solaris.
    # It basically depends on X's xdg-open.
    module Unix
      extend Rockt::Environment

      def self.commands
        %w( xdg-open )
      end

      def self.regex
        /(linux|bsd|aix|solaris)/i
      end
    end
  end
end