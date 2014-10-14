module Subvirtus

  module Boolean; end

  module ClassMethods

    def attribute( name, type = nil, options = {} )
      attr_writer name
      define_method( name ) do
        instance_variable = instance_variable_get "@#{ name }"
        if instance_variable.nil? and options[ :default ]
          instance_variable = options[ :default ]
        end
        unless type.nil? or instance_variable.is_a? type
          instance_variable = convert instance_variable, type
        end
        instance_variable
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
    when 'Subvirtus::Boolean'
      if value.nil?
        false
      elsif value.is_a? String
        value != ''
      elsif value.is_a? Integer
        value != 0
      elsif value.is_a? TrueClass or value.is_a? FalseClass
        value
      elsif value.is_a? Float
        value != 0.0
      else
        true
      end
    end
  end
end