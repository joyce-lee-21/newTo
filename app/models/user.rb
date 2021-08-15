class User < ApplicationRecord
    has_secure_password
    has_many :city_profiles

    # validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true

    def cities
        self.city_profiles.map{|profile| profile.city}
    end

    def category_selections
        self.city_profiles.map{|profile| profile.category_selections}
    end

    def venue_selections
        self.city_profiles.map{|profile| profile.saved_venues}
    end
end
