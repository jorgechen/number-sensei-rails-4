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

ActiveRecord::Schema.define(version: 20140512055728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "background_jobs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "progress",    default: 0
    t.integer  "total",       default: 0
    t.boolean  "in_progress"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "binary_operations", force: true do |t|
    t.integer  "left"
    t.integer  "right"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_attempts", force: true do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.integer  "correct"
    t.integer  "incorrect"
    t.integer  "skipped"
    t.integer  "total"
    t.integer  "score"
    t.integer  "time_taken"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenge_attempts", ["challenge_id"], name: "index_challenge_attempts_on_challenge_id", using: :btree
  add_index "challenge_attempts", ["user_id"], name: "index_challenge_attempts_on_user_id", using: :btree

  create_table "challenge_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenge_categories", ["name"], name: "index_challenge_categories_on_name", unique: true, using: :btree

  create_table "challenge_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "challenge_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "challenge_anc_desc_udx", unique: true, using: :btree
  add_index "challenge_hierarchies", ["descendant_id"], name: "challenge_desc_idx", using: :btree

  create_table "challenge_question_pairings", force: true do |t|
    t.integer  "challenge_id"
    t.integer  "question_id"
    t.integer  "numbering"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenge_question_pairings", ["challenge_id", "numbering"], name: "challenge_question_pair_idx", unique: true, using: :btree
  add_index "challenge_question_pairings", ["question_id"], name: "index_challenge_question_pairings_on_question_id", using: :btree

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.text     "checksum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "constants", force: true do |t|
    t.float    "value"
    t.string   "symbol"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "constants", ["name"], name: "index_constants_on_name", unique: true, using: :btree
  add_index "constants", ["symbol"], name: "index_constants_on_symbol", unique: true, using: :btree
  add_index "constants", ["value"], name: "index_constants_on_value", unique: true, using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id", using: :btree

  create_table "decimal_numbers", force: true do |t|
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decimal_numbers", ["value"], name: "index_decimal_numbers_on_value", unique: true, using: :btree

  create_table "experience_functions", force: true do |t|
    t.float    "coefficient_a"
    t.float    "coefficient_b"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experience_level_user_pairings", force: true do |t|
    t.integer  "user_id"
    t.integer  "experience_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experience_level_user_pairings", ["experience_level_id"], name: "index_experience_level_user_pairings_on_experience_level_id", using: :btree
  add_index "experience_level_user_pairings", ["user_id"], name: "index_experience_level_user_pairings_on_user_id", using: :btree

  create_table "experience_levels", force: true do |t|
    t.integer  "level"
    t.integer  "experience"
    t.integer  "level_up_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience_function_id"
  end

  create_table "expression_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "expression_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "expression_anc_desc_udx", unique: true, using: :btree
  add_index "expression_hierarchies", ["descendant_id"], name: "expression_desc_idx", using: :btree

  create_table "expression_value_pairings", force: true do |t|
    t.integer  "expression_id"
    t.integer  "value_id"
    t.string   "value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expression_value_pairings", ["expression_id"], name: "index_expression_value_pairings_on_expression_id", using: :btree
  add_index "expression_value_pairings", ["value_id", "value_type"], name: "index_expression_value_pairings_on_value_id_and_value_type", using: :btree

  create_table "expressions", force: true do |t|
    t.string   "token"
    t.string   "type"
    t.integer  "parent_id"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integer_numbers", force: true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "integer_numbers", ["value"], name: "index_integer_numbers_on_value", unique: true, using: :btree

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.integer  "numbering"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree

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

  create_table "question_attempts", force: true do |t|
    t.integer  "challenge_attempt_id"
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "result"
    t.string   "answer"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_attempts", ["challenge_attempt_id"], name: "index_question_attempts_on_challenge_attempt_id", using: :btree
  add_index "question_attempts", ["question_id"], name: "index_question_attempts_on_question_id", using: :btree
  add_index "question_attempts", ["user_id"], name: "index_question_attempts_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "problem_id"
    t.string   "problem_type"
    t.integer  "solution_id"
    t.string   "solution_type"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["problem_id", "problem_type"], name: "index_questions_on_problem_id_and_problem_type", using: :btree
  add_index "questions", ["solution_id", "solution_type"], name: "index_questions_on_solution_id_and_solution_type", using: :btree

  create_table "questions_tricks", force: true do |t|
    t.integer "question_id"
    t.integer "trick_id"
  end

  add_index "questions_tricks", ["question_id"], name: "index_questions_tricks_on_question_id", using: :btree
  add_index "questions_tricks", ["trick_id"], name: "index_questions_tricks_on_trick_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "roman_numerals", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tricks", force: true do |t|
    t.string   "strategy"
    t.string   "name"
    t.text     "hint"
    t.text     "guide"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "experience",             default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "words", force: true do |t|
    t.text     "part_of_speech"
    t.text     "category"
    t.text     "spelling"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
