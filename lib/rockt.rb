module Rockt

  def self.launch(uri, options = {})
    environment = detect

    environment.commands.each do |command|
      if which command
        # system(command, uri)
        puts "#{command} #{uri}"
        return command
      end
    end
  end

  def self.detect
    Rockt::Environment.detect
  end

  protected
  def self.which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']

    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each do |ext|
        exe = File.join(path, "#{cmd}#{ext}")
        return exe if File.executable? exe
      end
    end
  end

  autoload :VERSION, 'rockt/version'
  autoload :Environment, 'rockt/environment'
end