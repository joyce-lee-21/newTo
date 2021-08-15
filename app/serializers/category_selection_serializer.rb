class CategorySelectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :city_profile_id, :fs_category_id, :primary_category_id

  belongs_to :primary_category
end
