class AddStatusToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_column :chatrooms, :status, :string, default: "private"
  end
end
