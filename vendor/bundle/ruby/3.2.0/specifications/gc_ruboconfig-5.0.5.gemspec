# -*- encoding: utf-8 -*-
# stub: gc_ruboconfig 5.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "gc_ruboconfig".freeze
  s.version = "5.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["GoCardless".freeze]
  s.date = "2025-03-12"
  s.email = ["developers@gocardless.com".freeze]
  s.homepage = "https://github.com/gocardless/ruboconfig".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "GoCardless's shared Rubocop configuration, conforming to our house style".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rubocop>.freeze, [">= 1.73.2"])
  s.add_runtime_dependency(%q<rubocop-factory_bot>.freeze, [">= 2.27.0"])
  s.add_runtime_dependency(%q<rubocop-performance>.freeze, [">= 1.24"])
  s.add_runtime_dependency(%q<rubocop-rails>.freeze, [">= 2.30.3"])
  s.add_runtime_dependency(%q<rubocop-rspec>.freeze, [">= 3.5.0"])
  s.add_runtime_dependency(%q<rubocop-rspec_rails>.freeze, [">= 2.31.0"])
end
