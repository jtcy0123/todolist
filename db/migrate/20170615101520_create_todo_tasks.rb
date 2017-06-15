require_relative '../../config/application'

class CreateTodoTasks < ActiveRecord::Migration[4.2]
  def change
    create_table :tasks do |t|
      t.integer :number
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
