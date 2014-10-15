require 'spec_helper'

class PlainTest
  include Subvirtus
  attribute :here, Boolean, default: true
  attribute :name, String,  default: 'subvirtus'
  attribute :cash, Float, 	default: 9.57
  attribute :age,  Integer,	default: 12
  attribute :home, String,  default: 'Sweet Home'
end

describe PlainTest do
  before do
    @test = PlainTest.new( { here: false, name: 'david', cash: 12.34, age: 21, random: 'abc' } )
  end

  it "has the correct boolean value from a passed in hash" do
    expect( @test.here ).to eq( false )
  end

  it "has the correct string value from a passed in hash" do
    expect( @test.name ).to eq( 'david' )
  end

  it "has the correct float value from a passed in hash" do
    expect( @test.cash ).to eq( 12.34 )
  end

  it "has the correct integer value from a passed in hash" do
    expect( @test.age ).to eq( 21 )
  end

  it "ignores a random value in a passed in hash" do
    expect{ @test.random }.to raise_error
  end

  it "still works for attributes not set in a passed in hash" do
  	expect( @test.home ).to eq( 'Sweet Home' )
  end
end