# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wildcard_scopes/version"

Gem::Specification.new do |s|
  s.name        = "wildcard_scopes"
  s.version     = WildcardScopes::VERSION
  s.authors     = ["Victor Sokolov"]
  s.email       = ["gzigzigzeo@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ActiveRecord scopes with dynamic names}
  s.description = %q{ActiveRecord scopes with dynamic names}

  s.rubyforge_project = "wildcard_scopes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "sqlite3"
  s.add_dependency "activerecord", "~> 3.0"
  s.add_dependency "activesupport", "~> 3.0"
  s.add_dependency "railties", "~> 3.0"
end
