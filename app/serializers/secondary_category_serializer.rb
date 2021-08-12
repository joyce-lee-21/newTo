class SecondaryCategorySerializer < ActiveModel::Serializer
  attributes :id, :primary_category_id, :name, :fs_category_id
end
