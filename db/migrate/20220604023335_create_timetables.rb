class CreateTimetables < ActiveRecord::Migration[6.1]
  def change
    create_table :timetables do |t|
      t.string :day
      t.string :work
      t.integer :user_id

      t.timestamps
    end
  end
end
