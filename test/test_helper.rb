ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'

class Minitest::Test
# add on to minitest::test so everything that inherits it can use the
# teardown behavior
  def teardown
    TaskManager.delete_all
  end
end
