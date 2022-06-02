class Todolist < ApplicationRecord
    belongs_to :user
    validates :work, presence: true
end
