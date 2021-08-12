class CityProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :city

  belongs_to :user
end
