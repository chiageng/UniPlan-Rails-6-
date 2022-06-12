class AddTimeToTodolist < ActiveRecord::Migration[6.1]
  def change
    add_column :todolists, :day, :string
    add_column :todolists, :starttime, :datetime
    add_column :todolists, :endtime, :datetime
    add_column :todolists, :category, :string, default: "To-do"
  end
end
