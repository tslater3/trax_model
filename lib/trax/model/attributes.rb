require 'hashie/extensions/ignore_undeclared'

module Trax
  module Model
    module Attributes
      extend ::ActiveSupport::Autoload

      autoload :Mixin
      autoload :Definitions
      autoload :Errors
      autoload :Types
      autoload :Type

      define_configuration_options! do
        option :attribute_types, :default => {}
      end

      def self.register_attribute_type(mod)
        key = mod.name.demodulize.underscore.split('_')[0].to_sym

        config.attribute_types[key] = mod
      end

      def self.[](key)
        config.attribute_types[key]
      end

      def self.key?(type)
        config.attribute_types.has_key?(type)
      end

      def self.eager_autoload_types!
        ::Trax::Model::Attributes::Types
      end

      eager_autoload_types!
    end
  end
end