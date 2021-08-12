class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password_digest, :cities

  has_many :city_profiles
end
