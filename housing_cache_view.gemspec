# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'housing_cache_view/version'

Gem::Specification.new do |spec|
  spec.name          = "housing.cache.view"
  spec.version       = HousingCacheView::VERSION
  spec.authors       = ["Mohammed Riyaz"]
  spec.email         = ["mohammed.riyaz@housing.com"]
  spec.files         = Dir["{app,config,lib}/**/*"] + ["README.md"]
  spec.summary       = "Housing Cache View Gem"
  spec.description   = "A gem to read the values of caches from application servers"
  spec.homepage      = "https://github.com/elarahq/housing.cache.view"
  spec.license       = "MIT"
  spec.add_dependency "rails", ">= 4.2.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end
  
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "config", "app"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
