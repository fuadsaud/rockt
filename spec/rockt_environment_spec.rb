require 'spec_helper'

describe Rockt::Environment do
  rbconfig_host_oses = {}
  it 'should know at least one environment' do
    expect(Rockt::Environment::KNOWN_ENVIRONMENTS).not_to be_empty
  end

  it 'should correctly detect current environment' do
    (Rockt.detect.regex).should match(RbConfig::CONFIG['host_os'])
  end

  Rockt::Environment::KNOWN_ENVIRONMENTS.each do |env|
    it "should detect #{env}" do
      RbConfig::CONFIG.should_receive(:[])
                      .any_number_of_times
                      .with('host_os')
                      .and_return('darwin')

      (Rockt.detect.regex).should match(RbConfig::CONFIG['host_os'])
    end
  end

  it 'should fire current environment application launcher' do
    expect(Rockt.detect.commands).to include(Rockt.launch('http://github.com/fuadsaud'))
  end
end