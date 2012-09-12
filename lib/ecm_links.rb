require 'active_admin-acts_as_list'
require 'active_admin-awesome_nested_set'
require 'acts_as_list'
require 'acts_as_markup'
require 'awesome_nested_set'
require 'awesome_nested_set-tools'
require 'friendly_id'
require 'rails_tools-absence_validator'

require 'ecm/links/engine'
require 'ecm/links/configuration'
require 'ecm/links/routing'

module Ecm
  module Links
    extend Configuration
  end
end
