module Rockt
  module Environment
    class UnknownEnvironment < Exception; end

    autoload :OSX, 'rockt/environment/osx'

    KNOWN_ENVIRONMENTS = [OSX]

    def self.detect
      host_os = RbConfig::CONFIG['host_os']

      KNOWN_ENVIRONMENTS.each do |known_environment|
        return known_environment if known_environment.regex =~ host_os
      end

      fail UnknownEnvironment
    end
  end
end
