require 'spec_helper'

class Test
  include Subvirtus

  attribute :name, String,  default: 'subvirtus'
  attribute :age,  Integer, default: 42
  attribute :cash, Float,   default: 9.57
end

describe Test do
  before do
    @test = Test.new
  end

  # String tests
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

  # Fixnum tests
  it 'has an age attribute' do
    @test.age = 11
    expect( @test.age ).to eq( 11 )
  end
  it 'has an age attribute that is a integer' do
    @test.name = "foo"
    expect( @test.age.is_a? Integer ).to be_truthy
  end
  it 'has an age attribute that is a integer even though it is passed an string' do
    @test.age = "42"
    expect( @test.age.is_a? Integer ).to be_truthy
  end
  it 'has an age attribute that is a integer even though it is passed a float' do
    @test.age = 42.5
    expect( @test.age.is_a? Integer ).to be_truthy
  end
  it 'has an age attribute that is a integer even though it is passed a boolean' do
    @test.age = true
    expect( @test.age.is_a? Integer ).to be_truthy
  end
  it 'has an age attribute that is a integer even though it is passed a nil' do
    @test.age = nil
    expect( @test.age.is_a? Integer ).to be_truthy
  end
  it 'has an age attribute that is a integer even though it is not passed anything' do
    expect( @test.age.is_a? Integer ).to be_truthy
  end
  it 'has an age attribute that has a default value' do
    expect( @test.age ).to eq( 42 )
  end

  # Float tests
  it 'has an cash attribute' do
    @test.cash = 11.89
    expect( @test.cash ).to eq( 11.89 )
  end
  it 'has an cash attribute that is a float' do
    @test.name = 87.2
    expect( @test.cash.is_a? Float ).to be_truthy
  end
  it 'has an cash attribute that is a float even though it is passed an string' do
    @test.cash = "42.5"
    expect( @test.cash.is_a? Float ).to be_truthy
  end
  it 'has an cash attribute that is a float even though it is passed a fixnum' do
    @test.cash = 42
    expect( @test.cash.is_a? Float ).to be_truthy
  end
  it 'has an cash attribute that is a float even though it is passed a boolean' do
    @test.cash = true
    expect( @test.cash.is_a? Float ).to be_truthy
  end
  it 'has an cash attribute that is a float even though it is passed a nil' do
    @test.cash = nil
    expect( @test.cash.is_a? Float ).to be_truthy
  end
  it 'has an cash attribute that is a float even though it is not passed anything' do
    expect( @test.cash.is_a? Float ).to be_truthy
  end
  it 'has an cash attribute that has a default value' do
    expect( @test.cash ).to eq( 9.57 )
  end
end
