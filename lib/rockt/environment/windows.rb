# encoding: utf-8

module Rockt
  module Environment

    # Represents Microsoft Windows NT environments.
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