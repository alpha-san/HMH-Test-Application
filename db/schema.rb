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

ActiveRecord::Schema.define(version: 20150331025816) do

  create_table "data_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_cases", force: :cascade do |t|
    t.string   "id_description", limit: 255, null: false
    t.string   "title",          limit: 255
    t.integer  "use_case_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "test_cases", ["id_description"], name: "index_test_cases_on_id_description", unique: true, using: :btree

  create_table "test_executions", force: :cascade do |t|
    t.datetime "date"
    t.integer  "test_result_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "test_results", force: :cascade do |t|
    t.boolean  "status",            limit: 1
    t.string   "comment",           limit: 255
    t.integer  "test_execution_id", limit: 4
    t.integer  "test_step_id",      limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "test_steps", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.integer  "test_case_id",   limit: 4
    t.integer  "test_result_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "use_cases", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
