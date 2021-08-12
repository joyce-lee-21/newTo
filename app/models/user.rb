class User < ApplicationRecord
    has_secure_password
    has_many :city_profiles

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true, length: {minimum: 3}
    validates :password, presence: true

    def cities
        self.city_profiles.map{|profile| profile.city}
    end
end
