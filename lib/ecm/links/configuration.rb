require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module Links
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :link_footer_columns
      @@link_footer_columns = nil
      
      mattr_accessor :link_footer_column_css_classes
      @@link_footer_column_css_classes = nil
    end
  end
end
