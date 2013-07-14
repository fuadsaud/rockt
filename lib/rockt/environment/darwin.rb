# encoding: utf-8

module Rockt
  module Environment

    # Represents Darwin and Apple OS X environments.
    module Darwin
      extend Rockt::Environment

      def self.commands
        %w( open )
      end

      def self.regex
        /(darwin|mac os)/i
      end
    end
  end
end