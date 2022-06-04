class AddTimeToTimetable < ActiveRecord::Migration[6.1]
  def change
    add_column :timetables, :starttime, :datetime
    add_column :timetables, :endtime, :datetime
  end
end
