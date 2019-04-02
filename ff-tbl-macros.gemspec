# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'macros/version'

Gem::Specification.new do |s|
  s.name          = 'ff-tbl-macros'
  s.version       = ::Macros::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Artur Szwed, Claudio Perez Gamayo']
  s.email         = 'devops@firefield.com'
  s.homepage      = 'https://github.com/firefield/ff-tbl-macros'
  s.summary       = 'Trailblazer shared macros'
  s.description   = 'Collection of useful macros for Trailblazer to operate on context, contracts, params etc.'
  s.license       = 'MIT'

  s.add_dependency 'activesupport', '~> 5.2'
  s.add_dependency 'require_all', '~> 2.0'
  s.add_dependency 'trailblazer', '~> 2.0'

  s.files         = ['lib/ff-tbl-macros.rb']
  s.files        += Dir['lib/**/*.rb']
  s.files        += Dir['[A-Z]*'] + Dir['spec/**/*']
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = %w[lib]
end
