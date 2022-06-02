class AddUserIdToTodolist < ActiveRecord::Migration[6.1]
  def change
    add_column :todolists, :user_id, :integer
  end
end
