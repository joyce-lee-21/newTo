class AddIsCompletedToSavedVenues < ActiveRecord::Migration[6.1]
  def change
    add_column :saved_venues, :is_completed, :boolean
  end
end
