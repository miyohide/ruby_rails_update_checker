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

ActiveRecord::Schema.define(version: 20140514123817) do

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "person_in_charge"
    t.string   "contact_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ruby_version"
    t.string   "rails_version"
    t.string   "ruby_type"
  end

  create_table "rss_entries", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "entry_updated_at"
    t.text     "content"
    t.string   "name"
    t.string   "info_type"
    t.string   "info_target"
  end

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

end
