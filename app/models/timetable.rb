class Timetable < ApplicationRecord
    belongs_to :user

    validates :work, presence: true
    validates :day, presence: true
    validates :starttime, presence: true
    validates :endtime, presence: true
    validates :category, presence: true
end
