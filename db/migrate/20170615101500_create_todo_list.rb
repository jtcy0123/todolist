require_relative '../../config/application'

class CreateTodoList < ActiveRecord::Migration[4.2]
  def change
    create_table :list do |t|
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
