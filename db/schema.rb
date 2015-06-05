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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150605121228) do
=======
ActiveRecord::Schema.define(version: 20150603193823) do
>>>>>>> 1ff7d3d6531b2e63b8d7ec071ab2a9175c460b6e

  create_table "cms_pages", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cms_pages", ["user_id"], name: "index_cms_pages_on_user_id"

<<<<<<< HEAD
  create_table "concourse_project_categories", force: :cascade do |t|
    t.string   "name"
=======
  create_table "person_branch_lines", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
>>>>>>> 1ff7d3d6531b2e63b8d7ec071ab2a9175c460b6e
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "concourse_projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "background"
    t.string   "logo"
    t.date     "start"
    t.date     "end"
    t.time     "hour_end"
    t.boolean  "status"
    t.integer  "project_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "concourse_projects", ["project_category_id"], name: "index_concourse_projects_on_project_category_id"
=======
  create_table "person_jobs", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "acron"
    t.integer  "father_id"
    t.integer  "responsible_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "person_sectors", ["father_id"], name: "index_person_sectors_on_father_id"
  add_index "person_sectors", ["responsible_id"], name: "index_person_sectors_on_responsible_id"

  create_table "person_system_permissions", force: :cascade do |t|
    t.string   "action"
    t.string   "code"
    t.boolean  "status"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "person_system_permissions", ["system_id"], name: "index_person_system_permissions_on_system_id"

  create_table "person_systems", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_user_permissons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "system_permission_id"
    t.boolean  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "person_user_permissons", ["system_permission_id"], name: "index_person_user_permissons_on_system_permission_id"
  add_index "person_user_permissons", ["user_id"], name: "index_person_user_permissons_on_user_id"
>>>>>>> 1ff7d3d6531b2e63b8d7ec071ab2a9175c460b6e

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "code"
    t.string   "blood_type"
    t.date     "born"
    t.string   "avatar"
    t.string   "curriculum"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.time     "start_hour"
    t.time     "end_hour"
    t.date     "date_contract"
    t.boolean  "attendant"
    t.boolean  "wekeend"
    t.boolean  "status"
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

end
