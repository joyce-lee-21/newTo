class CategorySelection < ApplicationRecord
    belongs_to :city_profile
    belongs_to :primary_category

    # def show_user
    #     self.city_profile.user
    # end
end
