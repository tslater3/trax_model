module Trax
  module Model
    class Struct < ::Hashie::Dash
      include ::Hashie::Extensions::IgnoreUndeclared
      include ::Hashie::Extensions::StringifyKeys
      include ::ActiveModel::Validations
      include ::Hashie::Extensions::Coercion

      def self.struct_property(name, *args, **options, &block)
        struct_klass_name = "#{name}_structs".classify
        struct_klass = const_set(struct_klass_name, ::Class.new(::Trax::Model::Struct))
        struct_klass.instance_eval(&block)
        options[:default] = {} unless options.key?(:default)
        property(name, *args, **options)
        coerce_key(name, struct_klass)
      end
    end
  end
end