require 'spec_helper'

class PlainTest
  include Subvirtus
  attribute :name, String
end

describe PlainTest do
  before do
    @test = PlainTest.new
  end

  it 'returns a string value given' do
    @test.name = 'david'
    expect( @test.name ).to eq( 'david' )
  end
  it 'returns a string when given a string' do
    @test.name = 'david'
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a string when given an integer' do
    @test.name = 42
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a string representive of a given integer' do
    @test.name = 42
    expect( @test.name ).to eq( '42' )
  end
  it 'returns a string when given an float' do
    @test.name = 42.7
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a string representive of a given float' do
    @test.name = 42.7
    expect( @test.name ).to eq( '42.7' )
  end
  it 'returns a string when given a boolean' do
    @test.name = true
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a "false" when given a false' do
    @test.name = false
    expect( @test.name ).to eq( 'false' )
  end
  it 'returns a "true" when given a true' do
    @test.name = true
    expect( @test.name ).to eq( 'true' )
  end
  it 'returns a string when given a nil' do
    @test.name = nil
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns an empty string when given a nil' do
    @test.name = nil
    expect( @test.name ).to eq( '' )
  end
  it 'returns an empty string when nothing is passed in' do
    expect( @test.name ).to eq( '' )
  end
end

class TestWithDefault
  include Subvirtus
  attribute :name, String, default: 'subvirtus'
end

describe TestWithDefault do
  before do
    @test = TestWithDefault.new
  end

  it 'returns a string value given' do
    @test.name = 'david'
    expect( @test.name ).to eq( 'david' )
  end
  it 'returns a string when given a string' do
    @test.name = 'david'
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a string when given an integer' do
    @test.name = 42
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a string representive of a given integer' do
    @test.name = 42
    expect( @test.name ).to eq( '42' )
  end
  it 'returns a string when given an float' do
    @test.name = 42.7
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a string representive of a given float' do
    @test.name = 42.7
    expect( @test.name ).to eq( '42.7' )
  end
  it 'returns a string when given a boolean' do
    @test.name = true
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns a "false" when given a false' do
    @test.name = false
    expect( @test.name ).to eq( 'false' )
  end
  it 'returns a "true" when given a true' do
    @test.name = true
    expect( @test.name ).to eq( 'true' )
  end
  it 'returns a string when given a nil' do
    @test.name = nil
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'returns the default when given a nil' do
    @test.name = nil
    expect( @test.name ).to eq( 'subvirtus' )
  end
  it 'returns the default when nothing is passed in' do
    expect( @test.name ).to eq( 'subvirtus' )
  end
end