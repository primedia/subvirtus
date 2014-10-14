require 'spec_helper'

class PlainTest
  include Subvirtus
  attribute :name,  String
  attribute :age,   Integer
  attribute :here,  Boolean
  attribute :cash,  Float
end

describe PlainTest do
  before do
    @test = PlainTest.new
  end

  it 'returns separate initial values for multiple attributes' do
    expect( @test.name  ).to eq( ''     )
    expect( @test.age   ).to eq( 0      )
    expect( @test.here  ).to eq( false  )
    expect( @test.cash  ).to eq( 0.0    )
  end
  it 'returns separate values for multiple given attributes' do
    @test.name  = 'david'
    @test.age   = 42
    @test.here  = true
    @test.cash  = 9.57

    expect( @test.name  ).to eq( 'david'  )
    expect( @test.age   ).to eq( 42       )
    expect( @test.here  ).to eq( true     )
    expect( @test.cash  ).to eq( 9.57     )
  end
end

class TestWithDefaults
  include Subvirtus
  attribute :name,  String,   default: 'subvirtus'
  attribute :age,   Integer,  default: 43
  attribute :here,  Boolean,  default: true
  attribute :cash,  Float,    default: 9.99
end

describe TestWithDefaults do
  before do
    @test = TestWithDefaults.new
  end

  it 'returns separate initial values for multiple attributes' do
    expect( @test.name  ).to eq( 'subvirtus'  )
    expect( @test.age   ).to eq( 43           )
    expect( @test.here  ).to eq( true         )
    expect( @test.cash  ).to eq( 9.99         )
  end
  it 'returns separate values for multiple given attributes' do
    @test.name  = 'david'
    @test.age   = 42
    @test.here  = true
    @test.cash  = 9.57

    expect( @test.name  ).to eq( 'david'  )
    expect( @test.age   ).to eq( 42       )
    expect( @test.here  ).to eq( true     )
    expect( @test.cash  ).to eq( 9.57     )
  end
end