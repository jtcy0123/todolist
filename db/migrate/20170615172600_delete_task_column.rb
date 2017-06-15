require_relative '../../config/application'

class DeleteTaskColumn < ActiveRecord::Migration[4.2]
  def change
    remove_column :tasks, :number
  end
end
