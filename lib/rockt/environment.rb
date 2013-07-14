# encoding: utf-8

module Rockt
  #
  # This modules is responsible for detecting the current underlying
  # environment.
  #
  # It is meant to be extended by any module that represents an
  # environment; these must implement a _regex_ method, which should match the
  # environment name returned by the _host_os_ property from RbConfig, and a
  # _commands_ method, which returns a list of the commands that could be ran
  # to launch the application.
  #
  module Environment
    # Raised when cannot recognize the environment.
    UnknownEnvironment = Class.new(Exception)

    # List containing all modules extending Rockt::Environment.
    KNOWN_ENVIRONMENTS = []

    # Keep tack of defined environments.
    def self.extended(env)
      KNOWN_ENVIRONMENTS << env

      env_name = "#{env.to_s.split('::').last}?"

      # Define a #{environment_name}? method for each of the known.
      # environments.
      self.singleton_class.send(:define_method, env_name.downcase.to_sym) do
        detect == env
      end
    end

    # Detect current environment.
    def self.detect
      host_os = RbConfig::CONFIG['host_os']

      KNOWN_ENVIRONMENTS.find { |env| env.regex =~ host_os } or
        fail UnknownEnvironment
    end
  end
end

# Require bundled environemnts.
Dir[File.join(File.dirname(__FILE__), 'environment', '*.rb')].each do |env|
  require env
end
