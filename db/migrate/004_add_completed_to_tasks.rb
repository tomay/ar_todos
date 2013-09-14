require_relative '../../config/application'

class AddCompletedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completed, :boolean, default: false
  end

end