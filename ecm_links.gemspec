$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/links/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_links"
  s.version     = Ecm::Links::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_links"
  s.summary     = "Link management for active admin."
  s.description = "Link management for active admin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "active_admin-acts_as_list"
  s.add_dependency "active_admin-awesome_nested_set", '~> 0.0.3'  
  s.add_dependency 'acts_as_list'
  s.add_dependency 'acts_as_markup'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'awesome_nested_set-tools'
  s.add_dependency 'friendly_id'
  s.add_dependency 'rails_tools-absence_validator', '~> 0.0.1'

  s.add_development_dependency "sqlite3"

  # Development Server
  s.add_development_dependency "thin"

  # Documentation
  s.add_development_dependency "yard"

  # Active admin
  # s.add_development_dependency 'activeadmin' # Using edge version from github. See Gemfile.
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'

  # Tests
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails', '~> 2.12.0'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails', '~> 1.0'

  # Test automation
  s.add_development_dependency 'rb-inotify', '~> 0.8.8'
  # s.add_development_dependency 'guard-rails' # See gemfile for a patched version, for engine support.
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
end
