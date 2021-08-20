class SavedVenueSerializer < ActiveModel::Serializer
  attributes :id, :city_profile_id, :name, :address, :url, :rating, :fs_venue_id, :lat, :long, :is_completed, :user, :category

  belongs_to :city_profile
end
