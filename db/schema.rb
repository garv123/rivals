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

ActiveRecord::Schema.define(version: 20150530034716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "formats", force: :cascade do |t|
    t.string   "sender_name"
    t.string   "msg_regex_pattern"
    t.integer  "merchant_code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.integer  "merchant_code"
    t.string   "merchant_value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "messages", force: :cascade do |t|
    t.float    "amount"
    t.integer  "restaurant_id"
    t.string   "location"
    t.string   "sublocation"
    t.datetime "message_date"
    t.integer  "merchant_id"
    t.integer  "format_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "message_date_id"
    t.integer  "message_time_id"
    t.boolean  "bank_transaction"
  end

  add_index "messages", ["format_id"], name: "index_messages_on_format_id", using: :btree
  add_index "messages", ["merchant_id"], name: "index_messages_on_merchant_id", using: :btree
  add_index "messages", ["restaurant_id"], name: "index_messages_on_restaurant_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "contact_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "messages", "formats"
  add_foreign_key "messages", "merchants"
  add_foreign_key "messages", "restaurants"
  add_foreign_key "messages", "users"
end
