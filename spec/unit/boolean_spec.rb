require 'spec_helper'

class PlainTest
  include Subvirtus
  attribute :here, Boolean
end

describe PlainTest do
  before do
    @test = PlainTest.new
  end

  it 'returns true when set to true' do
    @test.here = false
    expect( @test.here ).to eq( false )
  end
  it 'returns false when set to false' do
    @test.here = true
    expect( @test.here ).to eq( true )
  end
  it 'returns true when passed a truthy string' do
    @test.here = 'anything not blank'
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey string' do
    @test.here = ''
    expect( @test.here ).to eq( false )
  end
  it 'returns true when passed a truthy integer' do
    @test.here = 42
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey integer' do
    @test.here = 0
    expect( @test.here ).to eq( false )
  end
  it 'returns true when passed a truthy float' do
    @test.here = 67.89
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey float' do
    @test.here = 0.0
    expect( @test.here ).to eq( false )
  end
  it 'returns false if passed nil with no default value' do
    @test.here = nil
    expect( @test.here ).to eq( false )
  end
  it 'returns false when not passed anything' do
    expect( @test.here ).to eq( false )
  end
end

class TrueTest
  include Subvirtus
  attribute :here, Boolean, default: true
end

describe TrueTest do
  before do
    @test = TrueTest.new
  end

  it 'returns true when set to true' do
    @test.here = false
    expect( @test.here ).to eq( false )
  end
  it 'returns false when set to false' do
    @test.here = true
    expect( @test.here ).to eq( true )
  end
  it 'returns true when passed a truthy string' do
    @test.here = 'anything not blank'
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey string' do
    @test.here = ''
    expect( @test.here ).to eq( false )
  end
  it 'returns true when passed a truthy integer' do
    @test.here = 42
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey integer' do
    @test.here = 0
    expect( @test.here ).to eq( false )
  end
  it 'returns true when passed a truthy float' do
    @test.here = 67.89
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey float' do
    @test.here = 0.0
    expect( @test.here ).to eq( false )
  end
  it 'returns true if passed nil with a default value of true' do
    @test.here = nil
    expect( @test.here ).to eq( true )
  end
  it 'returns true when not passed anything with a default value of true' do
    expect( @test.here ).to eq( true )
  end
end

class FalseTest
  include Subvirtus
  attribute :here, Boolean, default: false
end

describe FalseTest do
  before do
    @test = FalseTest.new
  end

  it 'returns true when set to true' do
    @test.here = false
    expect( @test.here ).to eq( false )
  end
  it 'returns false when set to false' do
    @test.here = true
    expect( @test.here ).to eq( true )
  end
  it 'returns true when passed a truthy string' do
    @test.here = 'anything not blank'
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey string' do
    @test.here = ''
    expect( @test.here ).to eq( false )
  end
  it 'returns true when passed a truthy integer' do
    @test.here = 42
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey integer' do
    @test.here = 0
    expect( @test.here ).to eq( false )
  end
  it 'returns true when passed a truthy float' do
    @test.here = 67.89
    expect( @test.here ).to eq( true )
  end
  it 'returns false when passed a falsey float' do
    @test.here = 0.0
    expect( @test.here ).to eq( false )
  end
  it 'returns false if passed nil with a default value of false' do
    @test.here = nil
    expect( @test.here ).to eq( false )
  end
  it 'returns false when not passed anything with a default value of false' do
    expect( @test.here ).to eq( false )
  end
end