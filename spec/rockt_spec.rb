require 'spec_helper'

describe Rockt do
  it 'should have a version' do
    expect(Rockt::VERSION).to be_an(String)
  end

  context 'given invalid URI' do
    context "it's a path for existing file" do
      it 'should not raise exception' do
        expect { Rockt.launch(__FILE__) }.not_to raise_error(Rockt::NoSuitableApplication)
      end
    end

    context "it's not a path for existing file" do
      it 'should raise exception' do
        expect { Rockt.launch("path-to-non-existing-file-#{Time.now.to_s}") }.to raise_error(Rockt::NoSuitableApplication)
      end
    end
  end

  context 'given valid URI' do
    pending "NOT IMPLEMENTED"
  end
end
