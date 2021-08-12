class CreateCategorySelections < ActiveRecord::Migration[6.1]
  def change
    create_table :category_selections do |t|
      t.string :name
      t.integer :city_profile_id
      t.string :fs_category_id
      t.integer :primary_category_id

      t.timestamps
    end
  end
end
