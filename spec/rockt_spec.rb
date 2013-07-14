# encoding: utf-8

require 'spec_helper'

describe Rockt do
  it 'has a version' do
    expect(Rockt::VERSION).to be_a String
  end

  describe '.launch' do
    let(:uri) { 'http://github.com/fuadsaud' }

    it 'returns one of the commands for the current environment' do
      command = Rockt.launch(uri, dry_run: true)

      expect(Rockt.detect_environment.commands).to include(command)
    end
  end

  describe '.detect_environment' do
    it 'correctly detects the current environment' do
      expect(
        Rockt.detect_environment.regex).to match RbConfig::CONFIG['host_os']
    end
  end
end
