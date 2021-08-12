class PrimaryCategory < ApplicationRecord
    has_many :category_selections
    has_many :secondary_categories    
end
