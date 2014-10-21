module Subvirtus
  module ValueObject
    module ClassMethods
      def values
        @in_values = true
        yield
        @in_values = false
        self
      end
    end

    def self.included( base )
      base.include Subvirtus
      base.extend ClassMethods
    end

    def ==( object )
      self.value_attributes.each do |vattr|
        return false unless object.respond_to?( vattr ) and object.send( vattr ) == send( vattr )
      end
      true
    end
  end
end