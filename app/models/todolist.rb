class Todolist < ApplicationRecord
    validates :work, presence: true
end
