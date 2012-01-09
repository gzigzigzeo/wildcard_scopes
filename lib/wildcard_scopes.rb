require 'active_record'
require 'active_support/concern'
require 'active_support/core_ext/class/attribute'
require 'rails/railtie'

module WildcardScopes
  require 'wildcard_scopes/version'
  require 'wildcard_scopes/base'
  require 'wildcard_scopes/railtie' if defined?(Rails)
end