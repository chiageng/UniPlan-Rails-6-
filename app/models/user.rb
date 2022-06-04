class User < ApplicationRecord
    before_save {self.email = email.downcase}
    has_many :todolists, dependent: :destroy
    has_many :forums, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :timetables, dependent: :destroy

    validates :username, presence: true, uniqueness: {case_sensitive: false}
	VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }

    has_secure_password
end
