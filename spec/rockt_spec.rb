require 'spec_helper'

describe Rockt do
  it 'should have a version' do
    expect(Rockt::VERSION).to be_an(String)
  end

  it 'should know at least one environment' do
    expect(Rockt::Environment::KNOWN_ENVIRONMENTS).not_to be_empty
  end

  it 'should correctly detect current environment' do
    (Rockt::detect.regex).should match(RbConfig::CONFIG['host_os'])
  end

  it 'should fire current environment application launcher' do
    expect(Rockt.detect.commands).to include(Rockt.launch('http://github.com/fuadsaud'))
  end
end
