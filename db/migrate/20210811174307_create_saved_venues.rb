class CreateSavedVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :saved_venues do |t|
      t.integer :city_profile_id
      t.string :name
      t.string :address
      t.string :url
      t.float :rating
      t.string :fs_venue_id
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
