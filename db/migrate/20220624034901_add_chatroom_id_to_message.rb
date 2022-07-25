class AddChatroomIdToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :chatroom_id, :integer
  end
end
