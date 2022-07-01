class User < ApplicationRecord
    before_save {self.email = email.downcase}
    has_many :todolists, dependent: :destroy
    has_many :forums, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :timetables, dependent: :destroy
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :user_categories, dependent: :destroy 
    has_many :categories, through: :user_categories
    has_many :messages, dependent: :destroy

    validates :username, presence: true, uniqueness: {case_sensitive: false}
	VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }

    has_secure_password

    scope :all_except, ->(user) {where.not(id: user)}

    def except_current_user(users)
        users.reject {|user| user_id == self.id } 
      end 
    
    def not_friend_with(friend_id)
        !self.friends.where(id: friend_id).exists?
    end 
end
