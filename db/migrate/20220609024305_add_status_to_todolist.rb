class AddStatusToTodolist < ActiveRecord::Migration[6.1]
  def change
    add_column :todolists, :status, :string, default: "Pending"
  end
end
