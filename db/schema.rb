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


ActiveRecord::Schema.define(version: 20151123152047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", null: false
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "breadcrumbs", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "receiver_id"
    t.boolean  "found"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.float    "lat"
    t.float    "long"
    t.string   "title"
    t.string   "subtitle"
    t.string   "identifier"
    t.string   "photo_aws_url"
<<<<<<< HEAD
=======
    t.string   "creator_email"
>>>>>>> cb7c3254f12f21105cd18c28a58b991188274b1c
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id", using: :btree

  create_table "pseudocrumbs", force: :cascade do |t|
    t.float    "lat"
    t.float    "long"
    t.string   "identifier"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "title"
    t.string   "subtitle"
    t.integer  "creator_id"
    t.integer  "receiver_id"
    t.boolean  "found",       default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
