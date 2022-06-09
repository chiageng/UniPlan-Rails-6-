class AddPriorityToTodolist < ActiveRecord::Migration[6.1]
  def change
    add_column :todolists, :priority, :string
  end
end
