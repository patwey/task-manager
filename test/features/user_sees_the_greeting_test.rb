require_relative '../test_helper'

class GreetingTest < FeatureTest
  def test_user_can_see_the_greeting
    visit '/'

    assert_equal '/', current_path # current_path is a capybara thing
    within("#greeting") do
      assert page.has_content?('Welcome to Task Manager')
    end
  end
end
