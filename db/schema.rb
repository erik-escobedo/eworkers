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

ActiveRecord::Schema.define(version: 20151102060847) do

  create_table "skills", force: :cascade do |t|
    t.string "name"
  end

  create_table "skills_workers", id: false, force: :cascade do |t|
    t.integer "worker_id"
    t.integer "skill_id"
  end

  add_index "skills_workers", ["skill_id"], name: "index_skills_workers_on_skill_id"
  add_index "skills_workers", ["worker_id", "skill_id"], name: "index_skills_workers_on_worker_id_and_skill_id", unique: true
  add_index "skills_workers", ["worker_id"], name: "index_skills_workers_on_worker_id"

  create_table "users", force: :cascade do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "workers", ["latitude"], name: "index_workers_on_latitude"
  add_index "workers", ["longitude"], name: "index_workers_on_longitude"
  add_index "workers", ["user_id"], name: "index_workers_on_user_id", unique: true

end
