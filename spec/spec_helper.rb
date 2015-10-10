require File.expand_path('../../config/environment', __FILE__)
require 'factory_girl_rails'
require 'shoulda-matchers'
require 'capybara/rspec'
require 'capybara-webkit'
require 'devise'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers

  require 'capybara/poltergeist'
  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {js_errors: false})
  end
  config.include Capybara::DSL

end

Capybara::Webkit.configure do |config|
  config.allow_url('http://platform.twitter.com/widgets.js')
end
