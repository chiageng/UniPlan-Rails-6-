class AddStatusToUserChatroom < ActiveRecord::Migration[6.1]
  def change
    add_column :user_chatrooms, :status, :string
  end
end
