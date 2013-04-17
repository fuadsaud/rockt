module Rockt
  module Logger

    class << self
      def setup!(dev)
        @logger = ::Logger.new(dev)
      end

      def method_missing(method, *args, &block)
        # @logger.send(method, *args, &block)
        STDERR.puts args if Rockt::OPTIONS[:verbose]
      end
    end
  end
end
