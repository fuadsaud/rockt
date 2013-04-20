module Rockt
  #
  # This modules is responsible for recognizing the current underlying
  # environment.
  #
  # It is to be extended by any module that represent an
  # environment; these must implement a _regex_ method - which should match the
  # environment name - and a _commands_ method - which will return an array
  # containing the commands that should be ran to launch the application.
  #
  module Environment
    # Raised when current environment is not recognized
    class UnknownEnvironment < Exception; end

    # List containing all modules extending Rockt::Environment
    KNOWN_ENVIRONMENTS = []

    # Keep tack of defined environments
    def self.extended(env)
      KNOWN_ENVIRONMENTS << env

      env_name = "#{env.to_s.split('::').last}?"

      self.singleton_class.send(:define_method, env_name.downcase.to_sym) do
        detect == env
      end
    end

    # Detect current environment
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
