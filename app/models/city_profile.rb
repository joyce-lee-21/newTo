class CityProfile < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :category_selections
    has_many :saved_venues
end
