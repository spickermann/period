require 'coveralls'
require 'rspec/its'

Coveralls.wear!

require 'period'

RSpec.configure do |config|

  # Print the 4 slowest examples at the end of the spec run.
  # config.profile_examples = 4

  # Run specs in random order to surface order dependencies.
  config.order = :random

  # rspec-expectations config goes here.
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  # rspec-mocks config goes here.
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

end
