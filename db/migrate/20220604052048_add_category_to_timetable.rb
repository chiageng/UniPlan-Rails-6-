class AddCategoryToTimetable < ActiveRecord::Migration[6.1]
  def change
    add_column :timetables, :category, :string
  end
end
