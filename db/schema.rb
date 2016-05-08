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

ActiveRecord::Schema.define(version: 20160508181244) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "duration"
    t.boolean  "accepted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "experience_id"
    t.integer  "visitor_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_experiences", id: false, force: :cascade do |t|
    t.integer "category_id",   null: false
    t.integer "experience_id", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.datetime "date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "guide_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "photo"
    t.integer  "rate"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides_languages", id: false, force: :cascade do |t|
    t.integer "guide_id",    null: false
    t.integer "language_id", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
