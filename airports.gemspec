# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "airports/version"

Gem::Specification.new do |spec|
  spec.name = "airports"
  spec.version = Airports::VERSION
  spec.authors = ["Tim Rogers"]
  spec.email = ["me@timrogers.co.uk"]

  spec.summary = "Access data on airports from around the world"
  spec.description = "Access data on airports from around the world"
  spec.homepage = "https://github.com/timrogers/airports"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.6"
end
