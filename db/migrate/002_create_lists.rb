require_relative '../../config/application'

class CreateLists < ActiveRecord::Migration
  def change
    create_table(:lists) do |t|
      t.string :listname
      t.integer :user_id

      t.timestamps
    end
  end
end