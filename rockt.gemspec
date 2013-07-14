$:.push File.expand_path("../lib", __FILE__)
require "rockt/version"

Gem::Specification.new do |s|
  s.name        = "rockt"
  s.version     = Rockt::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fuad Saud"]
  s.email       = ["fuadksd@gmail.com"]
  s.homepage    = "http://github.com/fuadsaud/rockt"

  s.summary     = "Stupid application launcher for ruby"
  s.description = "Rockt helps you to launch the right application to handle some file or webpage."
  s.licenses    = ['MIT']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = %w( lib )
end

