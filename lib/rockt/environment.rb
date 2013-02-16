require 'rockt/environment/osx'
require 'rockt/environment/unix'
require 'rockt/environment/windows'
require 'rockt/environment/cygwin'

module Rockt
  module Environment
    class UnknownEnvironment < Exception; end

    # TODO: Make environment recognition dynamic
    KNOWN_ENVIRONMENTS = [OSX, UNIX, Windows, Cygwin]

    def self.detect
      host_os = RbConfig::CONFIG['host_os']

      KNOWN_ENVIRONMENTS.each do |known_environment|
        return known_environment if known_environment.regex =~ host_os
      end

      fail UnknownEnvironment
    end
  end
end
