require_relative '../../config/application'

class ToDoController < ActiveRecord::Base

  def self.print_tasks(list_id)
    tasks = Task.find_all_by_list_id(list_id)
    #tasks = Task.all
    puts "List: #{List.find(list_id).listname}"
    tasks.each_with_index {|task, i|
      puts "#{i + 1}. #{task.description} (#{task.id}) #{("\u2714" if task.completed)}"
    }
  end

  def self.print_lists(user_id)
    lists = List.all
    lists.each_with_index {|list, i|
      puts "#{i + 1}. #{list.listname} [#{list_id}]"
    }
  end

  def self.print_users
    users = User.all
    users.each {|user|
      puts "#{user.id}. #{user.name}"
    }
  end
  
  def self.add_task(text, list_id)
    Task.create({:description => text, :list_id => list_id})
    self.print_tasks(list_id)
  end

  def self.delete_task(task_id)
    task = Task.find(task_id)
    task.destroy
    puts "Deleted task with id: #{task_id}"
  end

  def self.delete_list(list_id)
    list = List.find(list_id)
    list.destroy
    puts "Deleted list with id: #{list_id}"
  end

  def self.complete(task_id)
    task = Task.find(task_id)
    task.completed = true
    task.save
    self.print_tasks(task.list_id)
  end

end


# $ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
# $ ruby todo.rb list
# $ ruby todo.rb delete <task_id>
# $ ruby todo.rb complete <task_id>