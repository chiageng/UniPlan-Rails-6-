class Forum < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :forum_categories, dependent: :destroy
    has_many :categories, through: :forum_categories

    validates :topic, presence: true
    validates :description, presence: true

    def self.matches(field_name, param)
        where("#{field_name} like?", "%#{param}%")
    end 

    def self.topic_matches(param)
        matches("topic", param)
    end 

    def self.description_matches(param)
        matches("description", param)
    end 

    def self.search(param)
        param.strip!
        to_send_back = (topic_matches(param) + description_matches(param)).uniq
        return nil unless to_send_back
        to_send_back 
    end 
end
