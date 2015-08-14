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

ActiveRecord::Schema.define(version: 20150814105043) do

  create_table "movies", force: :cascade do |t|
    t.string   "search",      limit: 255
    t.string   "title",       limit: 255
    t.string   "main_char",   limit: 255
    t.string   "main_cast",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "second_char", limit: 255
    t.string   "second_cast", limit: 255
    t.string   "imdb_id",     limit: 255
    t.string   "poster"
  end

  create_table "post_credits_scenes", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "real_scenes", force: :cascade do |t|
    t.string   "imdb_id",    limit: 255
    t.string   "title",      limit: 255
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
  end

end
