ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'capybara/rails'
require 'vcr'
require 'minitest-vcr'
require 'webmock'
require 'minitest/pride'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  
  ActiveRecord::Migration.check_pending!

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  
  MinitestVcr::Spec.configure!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
