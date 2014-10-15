module Subvirtus

  module Boolean; end

  module ClassMethods

    attr_reader :attributes

    def attribute( name, type = nil, options = {} )
      @attributes ||= []
      @attributes << name
      attr_writer name
      define_method( name ) do
        value = instance_variable_get "@#{ name }"
        if value.nil? and options[ :default ]
          value = options[ :default ]
        end
        unless options[ :coercer ].nil?
          value = options[ :coercer ].call value
        end
        unless type.nil? or value.is_a? type
          value = convert value, type
        end
        value
      end
      self
    end
  end

  def self.included( base )
    base.extend ClassMethods
  end

  private

  def initialize( params = {} )
    params.each do |name, val|
      self.send( :"#{name}=", val ) if respond_to? "#{ name }="
    end
    self.class.send( :define_method, :to_hash ) do
      Hash[ self.class.attributes.map { |attribute| [ attribute, send( attribute ) ] } ]
    end
  end

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