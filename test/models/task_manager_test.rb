require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def setup
    # TODO
  end

  def test_all_returns_all_tasks
    TaskManager.create({ :title       => "My Title",
                         :description => "Get things done."})
    TaskManager.create({ :title       => "My Title 2",
                         :description => "Get things done, again."})
    tasks = TaskManager.all

    assert_equal "My Title", tasks[0].title
    assert_equal "My Title 2", tasks[1].title
  end

  def test_find_returns_the_task_with_given_id
    TaskManager.create({ :title       => "My Title",
                         :description => "Get things done."})
    TaskManager.create({ :title       => "My Title 2",
                         :description => "Get things done, again."})
    task = TaskManager.find(2)

    assert_equal 2, task.id
    assert_equal "My Title 2", task.title
    assert_equal "Get things done, again.", task.description
  end

  def test_task_is_created
    TaskManager.create({ :title       => "My Title",
                         :description => "Get things done."})
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "My Title", task.title
    assert_equal "Get things done.", task.description
  end

  def test_update_edits_task_with_given_id_in_db
    TaskManager.create({ :title       => "The Task",
                         :description => "The task: described."})

    TaskManager.update(1, { :title       => "The Task II",
                            :description => "The task strikes back."})
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "The Task II", task.title
    assert_equal "The task strikes back.", task.description
  end

  def test_delete_removes_the_task_with_given_id_from_db
    TaskManager.create({ :title       => "The Task",
                         :description => "The task: described."})
    TaskManager.delete(1)
    tasks = TaskManager.all

    assert_equal [], tasks
  end
end
