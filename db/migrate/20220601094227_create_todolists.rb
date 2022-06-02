class CreateTodolists < ActiveRecord::Migration[6.1]
  def change
    create_table :todolists do |t|
      t.string :work

      t.timestamps
    end
  end
end
