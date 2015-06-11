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

ActiveRecord::Schema.define(version: 20150609094703) do

  create_table "cms_page_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.integer  "page_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cms_pages", ["page_category_id"], name: "index_cms_pages_on_page_category_id"

  create_table "cms_post_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "post_category_id"
    t.boolean  "slider"
    t.string   "thumb"
    t.text     "resume"
    t.date     "date"
    t.boolean  "publish"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cms_posts", ["post_category_id"], name: "index_cms_posts_on_post_category_id"

  create_table "concourse_candidate_fields", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.boolean  "unique"
    t.string   "regular_expression"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "concourse_candidate_fields", ["project_id"], name: "index_concourse_candidate_fields_on_project_id"

  create_table "concourse_candidates", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "telphone"
    t.string   "celphone"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "email"
    t.string   "password"
    t.text     "parameters_fields"
    t.boolean  "status"
    t.integer  "status_project"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "concourse_candidates", ["city_id"], name: "index_concourse_candidates_on_city_id"
  add_index "concourse_candidates", ["project_id"], name: "index_concourse_candidates_on_project_id"
  add_index "concourse_candidates", ["state_id"], name: "index_concourse_candidates_on_state_id"

  create_table "concourse_navs", force: :cascade do |t|
    t.string   "link"
    t.integer  "target"
    t.string   "external_link"
    t.integer  "page_id"
    t.integer  "page_action"
    t.boolean  "publish"
    t.integer  "order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "concourse_navs", ["page_id"], name: "index_concourse_navs_on_page_id"

  create_table "concourse_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concourse_project_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "person_branch_lines", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type"

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
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.time     "start_hour"
    t.time     "end_hour"
    t.date     "date_contract"
    t.boolean  "attendant"
    t.boolean  "wekeend"
    t.boolean  "status",                 default: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "branch_lines_id"
    t.integer  "jobs_id"
    t.integer  "sector_origin_id"
    t.integer  "sector_current_id"
    t.integer  "user_responsible_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["branch_lines_id"], name: "index_users_on_branch_lines_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["jobs_id"], name: "index_users_on_jobs_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["sector_current_id"], name: "index_users_on_sector_current_id"
  add_index "users", ["sector_origin_id"], name: "index_users_on_sector_origin_id"
  add_index "users", ["user_responsible_id"], name: "index_users_on_user_responsible_id"

end
