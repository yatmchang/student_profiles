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

ActiveRecord::Schema.define(version: 20160711112738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "school"
    t.text     "description"
    t.string   "logo"
    t.string   "link"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current",     default: false
    t.integer  "profile_id"
  end

  add_index "educations", ["profile_id"], name: "index_educations_on_profile_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "job_title"
    t.string   "company"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current",     default: false
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "profile_id"
  end

  add_index "experiences", ["profile_id"], name: "index_experiences_on_profile_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "Github"
    t.string   "Twitter"
    t.string   "LinkedIn"
  end

  add_index "links", ["profile_id"], name: "index_links_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "avatar"
    t.text     "short_pitch"
    t.text     "long_pitch"
    t.boolean  "available",   default: false
    t.string   "resume"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "project_taggings", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "project_tag_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "project_taggings", ["project_id"], name: "index_project_taggings_on_project_id", using: :btree
  add_index "project_taggings", ["project_tag_id"], name: "index_project_taggings_on_project_tag_id", using: :btree

  create_table "project_tags", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "logo"
    t.string   "web_app_link"
    t.string   "github_link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "profile_id"
  end

  add_index "projects", ["profile_id"], name: "index_projects_on_profile_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "profile_id"
  end

  add_index "skills", ["profile_id"], name: "index_skills_on_profile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "is_admin",               default: false
    t.boolean  "approved",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "educations", "profiles"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "links", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "project_taggings", "project_tags"
  add_foreign_key "project_taggings", "projects"
  add_foreign_key "projects", "profiles"
  add_foreign_key "skills", "profiles"
end
