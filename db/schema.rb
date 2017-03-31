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

ActiveRecord::Schema.define(version: 20170331091433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "evaluation_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["evaluation_id"], name: "index_answers_on_evaluation_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "questionaire_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["questionaire_id"], name: "index_evaluations_on_questionaire_id", using: :btree
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "pending_evaluations", force: :cascade do |t|
    t.integer  "questionaire_id"
    t.integer  "user_id"
    t.integer  "progress",        default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["questionaire_id"], name: "index_pending_evaluations_on_questionaire_id", using: :btree
    t.index ["user_id"], name: "index_pending_evaluations_on_user_id", using: :btree
  end

  create_table "question_options", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_question_options_on_question_id", using: :btree
  end

  create_table "questionaires", force: :cascade do |t|
    t.string   "title"
    t.text     "instruction"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "questionaire_id"
    t.string   "category"
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["questionaire_id"], name: "index_questions_on_questionaire_id", using: :btree
  end

  create_table "treatment_processes", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "questionaire_id"
    t.string   "frequency"
    t.string   "duration"
    t.date     "start_date"
    t.integer  "creator_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["client_id"], name: "index_treatment_processes_on_client_id", using: :btree
    t.index ["creator_id"], name: "index_treatment_processes_on_creator_id", using: :btree
    t.index ["questionaire_id"], name: "index_treatment_processes_on_questionaire_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.bigint   "facebook_id"
    t.integer  "coach_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["coach_id"], name: "index_users_on_coach_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "answers", "evaluations"
  add_foreign_key "answers", "questions"
  add_foreign_key "evaluations", "questionaires"
  add_foreign_key "evaluations", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "pending_evaluations", "questionaires"
  add_foreign_key "pending_evaluations", "users"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "questionaires"
  add_foreign_key "treatment_processes", "questionaires"
  add_foreign_key "treatment_processes", "users", column: "client_id"
  add_foreign_key "treatment_processes", "users", column: "creator_id"
  add_foreign_key "users", "users", column: "coach_id"
end
