require 'hashie/extensions/ignore_undeclared'

module Trax
  module Model
    module Attributes
      module Types
        class Boolean < ::Trax::Model::Attributes::Type
          #this will by default validate boolean values
          def self.define_attribute(klass, attribute_name, **options, &block)
            attributes_klass = klass.fields_module.const_set(attribute_name.to_s.camelize,  ::Class.new(::Trax::Model::Attributes[:boolean]::Attribute))
            attributes_klass.instance_eval(&block) if block_given?
            klass.attribute(attribute_name, ::Trax::Model::Attributes::Types::Boolean.new(target_klass: attributes_klass))
            klass.validates(attribute_name, :boolean => true) unless options.key?(:validate) && !options[:validate]
            klass.default_value_for(attribute_name) { options[:default] } if options.key?(:default)
          end

          class Attribute < ::Trax::Model::Attributes::Attribute
            self.type = :boolean

            def self.to_schema

            end
          end

          class TypeCaster < ActiveRecord::Type::Boolean
          end
        end
      end
    end
  end
end