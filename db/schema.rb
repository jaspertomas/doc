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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130714050637) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "doc_entry_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.boolean  "is_default"
    t.integer  "sort_order"
    t.string   "fortype",    :limit => 10
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "doc_entries", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "category_id"
    t.integer  "topic_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "sort_order"
    t.integer  "state_id"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.boolean  "is_default"
    t.integer  "sort_order"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.boolean  "is_default"
    t.integer  "sort_order",               :default => 0
    t.string   "fortype",    :limit => 10
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.string   "content"
    t.integer  "sort_order"
    t.integer  "state_id"
  end

end
