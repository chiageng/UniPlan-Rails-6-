class Forum < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :forum_categories
    has_many :categories, through: :forum_categories

    validates :topic, presence: true
    validates :description, presence: true
end
