# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_08_16_233604) do
=======
ActiveRecord::Schema.define(version: 2021_08_20_151819) do
>>>>>>> main

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "category_selections", force: :cascade do |t|
    t.string "name"
    t.integer "city_profile_id"
    t.string "fs_category_id"
    t.integer "primary_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "city_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "primary_categories", force: :cascade do |t|
    t.string "name"
    t.string "fs_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "saved_venues", force: :cascade do |t|
    t.integer "city_profile_id"
    t.string "name"
    t.string "address"
    t.string "url"
    t.float "rating"
    t.string "fs_venue_id"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
<<<<<<< HEAD
=======
    t.boolean "is_completed"
>>>>>>> main
  end

  create_table "secondary_categories", force: :cascade do |t|
    t.integer "primary_category_id"
    t.string "name"
    t.string "fs_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
