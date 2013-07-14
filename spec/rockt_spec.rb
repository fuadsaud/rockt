# encoding: utf-8

require 'spec_helper'

describe Rockt do
  it 'has a version' do
    expect(Rockt::VERSION).to be_a String
  end

  describe '.launch' do
    let(:param) { 'http://github.com/fuadsaud' }

    it 'returns one of the command strings for the current environments' do
      command = Rockt.launch(param, dry_run: true)

      expect(Rockt.detect_environment.open).to include(command)
    end
  end
end
