# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

SimpleCov.minimum_coverage 80
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
                                                                  SimpleCov::Formatter::Console,
                                                                  SimpleCov::Formatter::HTMLFormatter,
                                                                ])
SimpleCov::Formatter::Console.show_covered = true
SimpleCov.coverage_dir 'coverage'
SimpleCov.start do
  cover 'lib/**/*.rb'
  skip %w[spec/ version.rb]
end

require 'dvla/wishy/washy/windows'

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.max_formatted_output_length = 10000
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
