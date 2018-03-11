
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

  spec.required_ruby_version = ">= 2.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "gc_ruboconfig", "~> 2.3.4"
  spec.add_development_dependency "pry", "~> 0.10.3", ">= 0.10.3"
  spec.add_development_dependency "rake", "~> 10.0", ">= 10.0"
  spec.add_development_dependency "rspec", "~> 3.3.0", ">= 3.3.0"
  spec.add_development_dependency "rspec-its", "~> 1.2.0", ">= 1.2.0"
end
