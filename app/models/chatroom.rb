class Chatroom < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :user_chatrooms, dependent: :destroy 
    has_many :users, through: :user_chatrooms

    
end
