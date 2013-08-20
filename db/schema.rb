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

ActiveRecord::Schema.define(version: 20130820002126) do

  create_table "challenge_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenge_categories", ["name"], name: "index_challenge_categories_on_name", unique: true

  create_table "decimal_numbers", force: true do |t|
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decimal_numbers", ["value"], name: "index_decimal_numbers_on_value", unique: true

  create_table "expression_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "expression_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "expression_anc_desc_udx", unique: true
  add_index "expression_hierarchies", ["descendant_id"], name: "expression_desc_idx"

  create_table "expressions", force: true do |t|
    t.string   "token"
    t.string   "type"
    t.integer  "parent_id"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fractions", force: true do |t|
    t.integer  "numerator"
    t.integer  "denominator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fractions", ["numerator", "denominator"], name: "index_fractions_on_numerator_and_denominator", unique: true

  create_table "integer_numbers", force: true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "integer_numbers", ["value"], name: "index_integer_numbers_on_value", unique: true

  create_table "official_challenges", force: true do |t|
    t.string   "upload"
    t.string   "name"
    t.date     "release_date"
    t.integer  "grade_level"
    t.integer  "difficulty"
    t.string   "event"
    t.integer  "category_id"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
