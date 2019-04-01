# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

%w[
  rubygems
  simplecov
  reform
  warden
  recursive-open-struct
  rspec/active_model/mocks
].each do |lib|
  require lib
end

# Don't include unnecessary stuff into rcov
SimpleCov.start do
  add_filter '/.bundle/'
  add_filter '/doc/'
  add_filter '/spec/'
  add_filter '/config/'
  merge_timeout 600
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.order = :random
  # config.mock_with :rspec

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end

require 'ff_tbl_macros'
