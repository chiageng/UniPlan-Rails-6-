class Category < ApplicationRecord
    has_many :forum_categories
    has_many :forum, through: :forum_categories
    has_many :user_categories 
    has_many :user, through: :user_categories

    validates :category, presence: true, uniqueness: {case_sensitive: false}
end
