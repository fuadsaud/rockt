#
# This is the main class for the rockt gem. It defines the public interface.
#
# = Usage
#
# It's deadly simple:
#   Rockt.launch('http://github.com/')
#
module Rockt
  class NoSuitableApplication < Exception; end
  class ApplicationLauncherNotFound < Exception; end

  @OPTIONS = {
    dry_run: false
  }

  OPTIONS = @OPTIONS.clone

  #
  # This is the method for launching applications.
  #
  # Available options are
  # - dry_run: do not run the command, only returns it
  #
  def self.launch(uri, options = {})
    OPTIONS.merge! options

    command = detect_environment.commands.select {|cmd| which cmd }.first

    command or fail ApplicationLauncherNotFound

    unless OPTIONS[:dry_run]
      Process::wait(Process::spawn(command, uri))
      $?.exitstatus == 0 or fail NoSuitableApplication
    end

    return command
  end

  #
  # Returns the module representing the current environment
  #
  def self.detect_environment
    Rockt::Environment.detect
  end

  def self.reset_default_options!
    OPTIONS.merge! @OPTIONS
  end

  protected
  #
  # Locate an executable file in the path
  #
  def self.which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']

    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each do |ext|
        exe = File.join(path, "#{cmd}#{ext}")
        return exe if File.executable? exe
      end
    end
  end

  require 'rockt/version'
  require 'rockt/environment'
end