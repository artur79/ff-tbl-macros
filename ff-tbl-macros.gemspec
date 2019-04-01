# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'macros/version'

Gem::Specification.new do |s|
  s.name          = 'ff-tbl-macros'
  s.version       = ::Macros::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Artur Szwed, Claudio Perez Gamayo']
  s.email         = %w[devops@firefield.com]
  s.homepage      = ''
  s.summary       = 'Trailblazer shared macros'
  s.description   = 'Trailblazer shared macros'
  s.license       = 'MIT'

  s.add_dependency 'activesupport'
  s.add_dependency 'require_all'
  s.add_dependency 'trailblazer'

  s.files         = ['lib/ff_tbl_macros.rb']
  s.files        += Dir['lib/**/*.rb']
  s.files        += Dir['[A-Z]*'] + Dir['spec/**/*']
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = %w[lib]
end
