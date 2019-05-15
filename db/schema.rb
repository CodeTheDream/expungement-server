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

ActiveRecord::Schema.define(version: 2019_05_14_133552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "offenses", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.string "race"
    t.string "address_number"
    t.string "street"
    t.integer "zip"
    t.string "county"
    t.string "state"
    t.string "file_number"
    t.string "offense_date"
    t.string "disposition"
    t.string "disposition_date"
    t.string "county_disposition"
    t.string "arrest_agency_name"
    t.string "arrest_agency_department"
    t.string "arrest_agency_address_number"
    t.integer "arrest_agency_street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dob"
    t.string "offense_description"
    t.string "arrest_date"
    t.string "arrest_agency_zip"
  end

end
