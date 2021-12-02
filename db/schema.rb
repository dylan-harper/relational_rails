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

ActiveRecord::Schema.define(version: 2021_12_02_223837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "hq_city_state"
    t.boolean "fdic_ins"
    t.boolean "mobile_app"
    t.decimal "size_by_assets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.integer "zip_code"
    t.boolean "has_atm"
    t.decimal "quarterly_rev"
    t.integer "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevatorcos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "num_technicians"
    t.boolean "offers_install?"
    t.boolean "offers_service?"
    t.boolean "offers_modernization?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
