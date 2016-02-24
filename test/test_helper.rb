ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'
require 'minitest/pride'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  fixtures :all

  # def teardown
  #   DatabaseCleaner.clean
  #   FactoryGirl.reload
  # end
  
end

