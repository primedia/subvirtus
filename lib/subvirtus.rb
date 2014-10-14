module Subvirtus
  module ClassMethods
    def attribute( name, type = nil, options = {} )
      define_method( :"#{ name }=" ) do |value|
        @name = value
      end
      define_method( name ) do
        if @name.nil? and options[ :default ]
          @name = options[ :default ]
        end
        unless type.nil? or @name.is_a? type
          @name = convert @name, type
        end
        @name
      end
      self
    end
  end

  def self.included( base )
    base.extend ClassMethods
  end

  private

  def convert( value, type )
    case type.to_s
    when 'String'
      value.to_s
    when 'Fixnum'
      value.to_i
    when 'Double'
      value.to_d
    when 'Boolean'
      value.to_b
    end
  end
end