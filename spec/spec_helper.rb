$: << 'lib'

require 'rspec'
require 'rockt'

RSpec.configure do |config|
  config.before { Rockt.reset_default_options! }
end