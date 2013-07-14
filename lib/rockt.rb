# encoding: utf-8

require 'English'

#
# Main Rockt API.
#
# It defines only on public method: launch.
#
module Rockt
  # Raised when the launcher helper fails.
  ApplicationLauncherFailed = Class.new(Exception)

  # Raised when no launcher helper is found.
  ApplicationLauncherNotFound = Class.new(Exception)

  require 'rockt/version'
  require 'rockt/environment'

  #
  # This is the method for launching applications.
  #
  # Valid options are:
  # - dry_run: doesn't launch the application.
  #
  def self.launch(uri, options = {})
    command = detect_environment.commands.find { |cmd| which cmd } or
      fail ApplicationLauncherNotFound

    unless options[:dry_run]
      _spawn command, uri

      fail ApplicationLauncherError unless $CHILD_STATUS.success?
    end

    command
  end

  #
  # Returns the module representing the current environment.
  #
  def self.detect_environment
    Environment.detect
  end

  private

  def self._spawn(command, *params)
    Process.wait spawn(command, *uri)
  end

  #
  # Locate an executable file in the path
  #
  def self.which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']

    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each do |ext|
        exe = File.join(path, "#{cmd}#{ext}")
        exe if File.executable? exe
      end
    end
  end
end
