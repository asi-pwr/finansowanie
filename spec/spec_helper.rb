# frozen_string_literal: true
ENV["RAILS_ENV"] ||= 'test'

Dir["./spec/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :doc

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random

  Kernel.srand config.seed
end
