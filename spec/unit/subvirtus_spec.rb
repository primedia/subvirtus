require 'spec_helper'

class Test
  include Subvirtus

  attribute :name, String, default: 'subvirtus'
end

describe Test do
  before do
    @test = Test.new
  end

  it 'has a name attribute' do
    @test.name = "foo"
    expect( @test.name ).to eq( "foo" )
  end
  it 'has a name attribute that is a string' do
    @test.name = "foo"
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that is a string even though it is passed an integer' do
    @test.name = 42
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that is a string even though it is passed a double' do
    @test.name = 42.5
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that is a string even though it is passed a boolean' do
    @test.name = true
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that is a string even though it is passed a nil' do
    @test.name = nil
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that is a string even though it is not passed anything' do
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that has a default value' do
    expect( @test.name ).to eq( 'subvirtus' )
  end
end
