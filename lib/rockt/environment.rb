module Rockt
  module Environment
    class UnknownEnvironment < Exception; end

    KNOWN_ENVIRONMENTS = []

    # Keep tack of defined environments
    def self.extended(extendor)
      KNOWN_ENVIRONMENTS << extendor
    end

    def self.detect
      host_os = RbConfig::CONFIG['host_os']

      KNOWN_ENVIRONMENTS.each do |known_environment|
        return known_environment if known_environment.regex =~ host_os
      end

      fail UnknownEnvironment
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'environment', '*.rb')].each do |env|
  require env
end
