# encoding: utf-8

require 'spec_helper'

describe Rockt::Environment do
  it 'should know at least one environment' do
    expect(Rockt::Environment::KNOWN_ENVIRONMENTS).not_to be_empty
  end
end