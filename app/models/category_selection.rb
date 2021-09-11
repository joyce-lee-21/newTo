class CategorySelection < ApplicationRecord
    belongs_to :city_profile
    belongs_to :primary_category
end
