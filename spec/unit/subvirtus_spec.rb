require 'spec_helper'

class Test
  include Subvirtus

  attribute :name, String, default: 'subvirtus'
  attribute :age,  Fixnum, default: 42
end

describe Test do
  before do
    @test = Test.new
  end

  it 'has a name attribute' do
    @test.name = "foo"
    expect( @test.name ).to eq( "foo" )
  end
  it 'has a age attribute that is a fixnum' do
    @test.name = "foo"
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that is a string even though it is passed an integer' do
    @test.name = 42
    expect( @test.name.is_a? String ).to be_truthy
  end
  it 'has a name attribute that is a string even though it is passed a float' do
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


  it 'has an age attribute' do
    @test.age = 11
    expect( @test.age ).to eq( 11 )
  end
  it 'has an age attribute that is a fixnum' do
    @test.name = "foo"
    expect( @test.age.is_a? Fixnum ).to be_truthy
  end
  it 'has an age attribute that is a fixnum even though it is passed an string' do
    @test.age = "42"
    expect( @test.age.is_a? Fixnum ).to be_truthy
  end
  it 'has an age attribute that is a fixnum even though it is passed a float' do
    @test.age = 42.5
    expect( @test.age.is_a? Fixnum ).to be_truthy
  end
  it 'has an age attribute that is a fixnum even though it is passed a boolean' do
    @test.age = true
    expect( @test.age.is_a? Fixnum ).to be_truthy
  end
  it 'has an age attribute that is a fixnum even though it is passed a nil' do
    @test.age = nil
    expect( @test.age.is_a? Fixnum ).to be_truthy
  end
  it 'has an age attribute that is a fixnum even though it is not passed anything' do
    expect( @test.age.is_a? Fixnum ).to be_truthy
  end
  it 'has an age attribute that has a default value' do
    expect( @test.age ).to eq( 42 )
  end
end
