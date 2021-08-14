class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :cities, :category_selections

  has_many :city_profiles
end
