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

ActiveRecord::Schema.define(version: 20160821182226) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "graders", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "grader_type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "graders", ["email"], name: "index_graders_on_email", unique: true
  add_index "graders", ["reset_password_token"], name: "index_graders_on_reset_password_token", unique: true

  create_table "grades", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "grader_id"
    t.integer  "usability_score"
    t.integer  "technical_score"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "phase"
    t.integer  "tech_criteria_1"
    t.integer  "tech_criteria_2"
    t.integer  "tech_criteria_3"
    t.integer  "tech_criteria_4"
    t.integer  "tech_criteria_5"
    t.integer  "tech_criteria_6"
    t.integer  "tech_criteria_7"
    t.integer  "tech_criteria_8"
    t.integer  "non_tech_criteria_1"
    t.integer  "non_tech_criteria_2"
    t.integer  "non_tech_criteria_3"
    t.integer  "non_tech_criteria_4"
    t.integer  "non_tech_criteria_5"
    t.integer  "non_tech_criteria_6"
    t.integer  "non_tech_criteria_7"
    t.integer  "non_tech_criteria_8"
    t.integer  "non_tech_criteria_9"
    t.integer  "non_tech_criteria_10"
    t.integer  "non_tech_criteria_11"
    t.boolean  "technical",                     default: false
    t.boolean  "usability",                     default: false
    t.integer  "major_errors",                  default: 0
    t.integer  "moderate_errors",               default: 0
    t.integer  "minor_errors",                  default: 0
    t.text     "novelty_1_text"
    t.text     "novelty_2_text"
    t.text     "novelty_3_text"
    t.text     "novelty_4_text"
    t.text     "novelty_5_text"
    t.integer  "novelty_1_score"
    t.integer  "novelty_2_score"
    t.integer  "novelty_3_score"
    t.integer  "novelty_4_score"
    t.integer  "novelty_5_score"
    t.integer  "novelty_1_design_score"
    t.integer  "novelty_2_design_score"
    t.integer  "novelty_3_design_score"
    t.integer  "novelty_4_design_score"
    t.integer  "novelty_5_design_score"
    t.integer  "novelty_1_functionality_score"
    t.integer  "novelty_2_functionality_score"
    t.integer  "novelty_3_functionality_score"
    t.integer  "novelty_4_functionality_score"
    t.integer  "novelty_5_functionality_score"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "web_url"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "read_me_url"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "github"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
