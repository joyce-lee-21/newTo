class CreateCityProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :city_profiles do |t|
      t.integer :user_id
      t.string :city

      t.timestamps
    end
  end
end
