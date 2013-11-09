# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131031232832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sites", force: true do |t|
    t.text     "facility"
    t.text     "street_address"
    t.text     "street_address2"
    t.text     "city"
    t.text     "state"
    t.text     "country"
    t.text     "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trial_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "status"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_phone_ext"
    t.string   "contact_phone_email"
  end

  create_table "trials", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.text     "sponsor"
    t.text     "country"
    t.text     "focus"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "nct_id"
    t.text     "official_title"
    t.text     "agency_class"
    t.text     "detailed_description"
    t.text     "overall_status"
    t.text     "phase"
    t.text     "study_type"
    t.text     "condition"
    t.text     "inclusion"
    t.text     "exclusion"
    t.text     "gender"
    t.integer  "minimum_age",           default: 0,   null: false
    t.integer  "maximum_age",           default: 120, null: false
    t.text     "healthy_volunteers"
    t.text     "overall_contact_name"
    t.text     "overall_contact_phone"
    t.text     "overall_contact_email"
    t.text     "location_countries"
    t.text     "link_url"
    t.text     "link_description"
    t.text     "firstreceived_date"
    t.date     "lastchanged_date"
    t.date     "verification_date"
    t.text     "keyword"
    t.text     "is_fda_regulated"
    t.text     "has_expanded_access"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "username"
    t.string   "token"
    t.string   "token_secret"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
