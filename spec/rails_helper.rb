require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
# upload image file for image_format_test
  config.include ActionDispatch::TestProcess
  FactoryGirl::SyntaxRunner.class_eval do
    include ActionDispatch::TestProcess
  end
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
end
