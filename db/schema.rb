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

ActiveRecord::Schema.define(version: 20160203125916) do

  create_table "ads", force: :cascade do |t|
    t.string  "title"
    t.string  "body"
    t.integer "user_id"
  end

  create_table "asks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "target_id"
    t.text    "body"
    t.text    "answer"
  end

  add_index "asks", ["target_id"], name: "index_asks_on_target_id"
  add_index "asks", ["user_id"], name: "index_asks_on_user_id"

  create_table "feeds", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
  end

  create_table "insts", force: :cascade do |t|
    t.string   "inst"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "insts", ["user_id"], name: "index_insts_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string  "body"
    t.integer "user_id"
    t.string  "title"
    t.string  "foto"
    t.string  "video"
  end

  create_table "savedposts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token"
    t.string "email_tmp"
    t.string "user_id"
  end

  create_table "tusas", force: :cascade do |t|
    t.string "name"
    t.string "tel"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "token"
    t.string "avatar"
    t.string "provider"
    t.string "uid"
  end

end
