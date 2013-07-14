# encoding: utf-8

require 'spec_helper'

describe Rockt::Environment do
  it 'should know at least one environment' do
    expect(Rockt::Environment::KNOWN_ENVIRONMENTS).not_to be_empty
  end

  it 'should correctly detect current environment' do
    expect(
      Rockt.detect_environment.regex).to match(RbConfig::CONFIG['host_os'])
  end

  Rockt::Environment::KNOWN_ENVIRONMENTS.each do |env|
    it "should detect #{env}" do
      RbConfig::CONFIG.stub(:[]).with('host_os').and_return('darwin')

      expect(
        Rockt.detect_environment.regex).to match(RbConfig::CONFIG['host_os'])
    end
  end
end