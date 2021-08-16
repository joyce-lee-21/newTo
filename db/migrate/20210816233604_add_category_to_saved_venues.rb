class AddCategoryToSavedVenues < ActiveRecord::Migration[6.1]
  def change
    add_column :saved_venues, :category, :string
  end
end
