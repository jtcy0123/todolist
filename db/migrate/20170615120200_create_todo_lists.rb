require_relative '../../config/application'

class CreateTodoLists < ActiveRecord::Migration[4.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.timestamps
    end
  end
end
