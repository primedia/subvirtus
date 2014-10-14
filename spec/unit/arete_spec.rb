require 'spec_helper'

module Arete
  describe Arete do
    it 'says hello' do
      expect( Arete.say_hello ).to eq( 'Hello!' )
    end
  end
end
