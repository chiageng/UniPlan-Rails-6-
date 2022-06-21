class ForumCategory < ApplicationRecord
    belongs_to :forum 
    belongs_to :category 
end
