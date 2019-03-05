# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'macros/version'

Gem::Specification.new do |spec|
  spec.name          = 'ff-tbl-macros'
  spec.version       = ::Macros::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Artur Szwed, Claudio Perez Gamayo']
  spec.email         = %w[devops@firefield.com]
  spec.files         = ['lib/ff_tbl_macros.rb']
  spec.homepage      = 'http://firefield.com'
  spec.summary       = 'Trailblazer shared macros for Firefield apps'
  spec.description   = 'Trailblazer shared macros for Firefield apps'
  spec.license       = 'MIT'

  spec.add_dependency 'activesupport'
  spec.add_dependency 'require_all'
  spec.add_dependency 'trailblazer'
  spec.add_dependency 'firefield_event_store' # TODO temp
  spec.add_development_dependency 'bundler'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = %w[lib]
end
