#
# This is the main class for the rockt gem. It defines the public interface.
#
# = Usage
#
# It's deadly simple:
#   Rockt.launch('http://github.com/')
#
module Rockt

  #
  # This is the method for launching applications.
  #
  # Available options are
  # - dry_run: do not run the command, only returns it
  def self.launch(uri, options = {})
    environment = detect

    environment.commands.each do |command|
      if which command
        if options[:dry_run]
          return command
        else
          system(command, uri)
        end
      end
    end
  end

  #
  # Returns the module representing the current environment
  #
  def self.detect
    Rockt::Environment.detect
  end

  protected
  #
  # Locate an executable file in the path.
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