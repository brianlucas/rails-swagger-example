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

ActiveRecord::Schema.define(version: 20140923021322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cookies", force: true do |t|
    t.string   "cookie_type"
    t.boolean  "gluten_free"
    t.float    "price"
    t.integer  "monster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cookies", ["monster_id"], name: "index_cookies_on_monster_id", using: :btree

  create_table "monsters", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "role"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
