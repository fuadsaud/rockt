require 'spec_helper'

describe Rockt::Environment do
  it 'should know at least one environment' do
    expect(Rockt::Environment::KNOWN_ENVIRONMENTS).not_to be_empty
  end

  it 'should correctly detect current environment' do
    (Rockt.detect_environment.regex).should match(RbConfig::CONFIG['host_os'])
  end

  Rockt::Environment::KNOWN_ENVIRONMENTS.each do |env|
    it "should detect #{env}" do
      RbConfig::CONFIG.should_receive(:[])
                      .any_number_of_times
                      .with('host_os')
                      .and_return('darwin')

      (Rockt.detect_environment.regex).should match(RbConfig::CONFIG['host_os'])
    end
  end

  it 'should fire current environment application launcher' do
    command = Rockt.launch('http://github.com/fuadsaud', dry_run: true)

    expect(Rockt.detect_environment.open).to include(command)
  end
end