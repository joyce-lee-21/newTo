class CreateSecondaryCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :secondary_categories do |t|
      t.integer :primary_category_id
      t.string :name
      t.string :fs_category_id

      t.timestamps
    end
  end
end
