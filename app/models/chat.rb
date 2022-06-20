class Chat < ApplicationRecord
	has_many :messages, dependent: :destroy, inverse_of: :chat
	has_many :users
end
