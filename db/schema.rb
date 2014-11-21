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

ActiveRecord::Schema.define(version: 20141204103805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "permalink",  limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["permalink"], name: "index_categories_on_permalink", unique: true, using: :btree

  create_table "creative_works", force: true do |t|
    t.string   "title",        limit: 255, null: false
    t.string   "permalink",    limit: 255, null: false
    t.text     "description"
    t.datetime "published_at"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "creative_works", ["permalink"], name: "index_creative_works_on_permalink", unique: true, using: :btree
  add_index "creative_works", ["published_at"], name: "index_creative_works_on_published_at", using: :btree

  create_table "image_assets", force: true do |t|
    t.string   "file",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media_assets", force: true do |t|
    t.string   "file",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title",        limit: 255, null: false
    t.string   "permalink",    limit: 255, null: false
    t.text     "body"
    t.datetime "published_at"
    t.integer  "category_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", unique: true, using: :btree
  add_index "posts", ["published_at"], name: "index_posts_on_published_at", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.date     "from"
    t.date     "until"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name",           limit: 255,             null: false
    t.string  "permalink",      limit: 255,             null: false
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  add_index "tags", ["permalink"], name: "index_tags_on_permalink", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
