require_relative '../test_helper'

# user can create a task test
class CreateTaskTest < FeatureTest
  # as a user, when I visit the homepage, and I click on the new task button,
  # then I see a form with title and description inputs
  def test_user_can_see_the_new_task_form
    visit '/'
    assert_equal '/', current_path

    click_link('New Task')
    assert_equal '/tasks/new', current_path

    page.has_css?("#newTaskForm")

    within('#newTaskForm') do
      assert page.has_css?('#taskTitle')
      assert page.has_css?('#taskDescription')
      assert page.has_content?("Submit")
    end
  end

  # as a user, when I visit the new task page, and I enter a title and description,
  # and I click the submit button, then a new task is created and I am routed to the index page
  def test_user_can_submit_a_new_task_form_that_create_new_task
    visit '/tasks/new'
    assert_equal '/tasks/new', current_path
    within('#newTaskForm') do
      fill_in('task[title]', with: 'Feature Testing')
      fill_in('task[description]', with: 'I M using Capybara')
      click_button('create task') # id set as a value on the button
    end

    assert_equal '/tasks', current_path
  end

  # as a user, when I visit the new task page, and I do not enter a title,
  # and I click submit, then I am prompted to enter a title.
  def test_user_is_prompted_to_enter_a_title_if_they_dont_enter_one
    skip
  end

  # as a user, when I visit the new task page, and I do not enter a description,
  # and I click submit, then I am prompted to enter a description.
  def test_user_is_prompted_to_enter_a_description_if_they_dont_enter_one
    skip
  end
end
