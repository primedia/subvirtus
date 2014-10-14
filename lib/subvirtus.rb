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
    when 'Integer'
      if value.respond_to? :to_i
        value.to_i
      elsif value.is_a? TrueClass or value.is_a? FalseClass
        value ? 1 : 0
      end
    when 'Float'
      if value.respond_to? :to_f
        value.to_f
      elsif value.is_a? TrueClass or value.is_a? FalseClass
        value ? 1.0 : 0.0
      end
    when 'Boolean'
      value.to_b
    end
  end
end