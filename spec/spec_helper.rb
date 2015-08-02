require File.expand_path('../../config/environment', __FILE__)
require 'factory_girl_rails'
require 'shoulda-matchers'
require 'capybara/rspec'
require 'capybara-webkit'
require 'devise'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers
  config.include Capybara::DSL

  config.before(:all) do
    Capybara.default_selector = :css
    Capybara.javascript_driver = :webkit
  end
end

Capybara::Webkit.configure do |config|
  config.allow_url('http://platform.twitter.com/widgets.js')
end
