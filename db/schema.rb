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

ActiveRecord::Schema.define(version: 20140328211545) do

  create_table "assignments", force: true do |t|
    t.integer "total"
    t.integer "score"
    t.integer "student_id"
    t.string  "name"
  end

  create_table "attendances", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seat"
    t.date     "attended_on"
    t.integer  "student_id"
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "#<ActiveRecord::ConnectionAdapters::TableDefinition:0x00000004ebc928>_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.text     "image"
    t.string   "password_digest"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
