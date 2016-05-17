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

ActiveRecord::Schema.define(version: 20160516215333) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "duration"
    t.boolean  "accepted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "experience_id"
    t.integer  "visitor_id"
    t.datetime "date"
    t.integer  "guide_id"
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
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "guide_id"
    t.string   "name"
  end

  create_table "guides", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "photo"
    t.integer  "rate"
    t.string   "city"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "description"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "transportation"
  end

  add_index "guides", ["email"], name: "index_guides_on_email", unique: true
  add_index "guides", ["reset_password_token"], name: "index_guides_on_reset_password_token", unique: true

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email",                  default: "", null: false
    t.string   "photo"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "visitors", ["reset_password_token"], name: "index_visitors_on_reset_password_token", unique: true

end
