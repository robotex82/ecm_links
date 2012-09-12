require 'acts_as_list'
require 'acts_as_markup'
require 'awesome_nested_set'
require 'friendly_id'
require 'rails_tools-absence_validator'

require 'ecm/links/engine'
require 'ecm/links/configuration'

module Ecm
  module Links
    extend Configuration
  end
end
