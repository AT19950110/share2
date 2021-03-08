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

ActiveRecord::Schema.define(version: 20210225224118) do

  create_table "reservations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "total_price"
    t.integer  "group"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "n1_price"
    t.string   "room_image"
    t.string   "room_name"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "room_name"
    t.string   "adress"
    t.text     "introduction"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "room_image"
    t.string   "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "self_introduction"
    t.string   "user_image"
    t.string   "password_digest"
    t.string   "repassword"
  end

end
