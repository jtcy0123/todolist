require_relative '../../config/application'

class AddTaskColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :tasks, :list_id, :integer
  end
end
