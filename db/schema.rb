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

ActiveRecord::Schema.define(version: 20170312202719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservation_joins", force: :cascade do |t|
    t.integer  "reservation_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["reservation_id"], name: "index_reservation_joins_on_reservation_id", using: :btree
    t.index ["user_id", "reservation_id"], name: "index_reservation_joins_on_user_id_and_reservation_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_reservation_joins_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "rid",                 null: false
    t.string   "confirmation_number", null: false
    t.string   "first_name",          null: false
    t.string   "last_name",           null: false
    t.string   "date_time",           null: false
    t.integer  "party_size",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "image_url",     null: false
    t.text     "description",   null: false
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "phone_number",  null: false
    t.string   "session_token", null: false
    t.string   "authy_id",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "country_code"
    t.index ["authy_id"], name: "index_users_on_authy_id", using: :btree
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
    t.index ["session_token"], name: "index_users_on_session_token", using: :btree
  end

end
