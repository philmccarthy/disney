# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_05_144352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resorts", force: :cascade do |t|
    t.string "name"
    t.integer "amount_of_rooms"
    t.boolean "vacancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.integer "max_occupants"
    t.boolean "operational"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theme_park_id"
    t.index ["theme_park_id"], name: "index_rides_on_theme_park_id"
  end

  create_table "theme_parks", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.boolean "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacationers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "checked_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "resort_id"
    t.index ["resort_id"], name: "index_vacationers_on_resort_id"
  end

  add_foreign_key "rides", "theme_parks"
  add_foreign_key "vacationers", "resorts"
end
