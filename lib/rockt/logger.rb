module Rockt
  module Logger

    class << self
      def setup!(dev)
        @dev = dev
      end

      def method_missing(method, *args, &block)
        @dev.puts args if Rockt::OPTIONS[:verbose]
      end
    end
  end
end
