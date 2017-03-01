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

ActiveRecord::Schema.define(version: 20170301112657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: :cascade do |t|
    t.string   "brand"
    t.string   "manufacturer"
    t.string   "nickname"
    t.string   "immatriculation"
    t.string   "model"
    t.string   "boat_type"
    t.float    "length"
    t.float    "width"
    t.float    "draught"
    t.boolean  "multihull",       default: false
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_boats_on_deleted_at", using: :btree
    t.index ["user_id"], name: "index_boats_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.date     "arrival_date"
    t.date     "departure_date"
    t.decimal  "invoiced_price"
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "boat_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "place_id"
    t.datetime "deleted_at"
    t.index ["boat_id"], name: "index_bookings_on_boat_id", using: :btree
    t.index ["deleted_at"], name: "index_bookings_on_deleted_at", using: :btree
    t.index ["place_id"], name: "index_bookings_on_place_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.decimal  "place_price"
    t.float    "length"
    t.float    "width"
    t.float    "draught"
    t.boolean  "ss_elec",            default: false
    t.boolean  "ss_fresh_water",     default: false
    t.boolean  "ss_ice",             default: false
    t.boolean  "ss_fuel",            default: false
    t.boolean  "ss_tel",             default: false
    t.boolean  "ss_wifi",            default: false
    t.boolean  "ss_shower",          default: false
    t.boolean  "sc_waste_sorting",   default: false
    t.boolean  "sc_waste_pumping",   default: false
    t.boolean  "sc_security",        default: false
    t.boolean  "sc_waste_container", default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "port_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_places_on_deleted_at", using: :btree
    t.index ["port_id"], name: "index_places_on_port_id", using: :btree
  end

  create_table "ports", force: :cascade do |t|
    t.string   "port_name"
    t.string   "legal_entity"
    t.string   "picture"
    t.decimal  "lng"
    t.decimal  "lat"
    t.string   "phone_number"
    t.string   "radio_channel"
    t.string   "email"
    t.string   "address"
    t.string   "check_in_hour"
    t.string   "check_out_hour"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description"
    t.integer  "size"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_ports_on_deleted_at", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "phone_number"
    t.string   "civility"
    t.string   "address"
    t.string   "post_code"
    t.string   "city"
    t.string   "country"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "boats", "users"
  add_foreign_key "bookings", "boats"
  add_foreign_key "bookings", "users"
end
