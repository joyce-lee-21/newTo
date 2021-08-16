class SavedVenue < ApplicationRecord
    belongs_to :city_profile

    def user
        self.city_profile.user
    end
end
