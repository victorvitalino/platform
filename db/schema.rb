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

ActiveRecord::Schema.define(version: 20150618172517) do

  create_table "cms_nav_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_navs", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.integer  "target"
    t.integer  "internal_link_id"
    t.string   "external_link"
    t.integer  "nav_category_id"
    t.integer  "order"
    t.boolean  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cms_navs", ["internal_link_id"], name: "index_cms_navs_on_internal_link_id"
  add_index "cms_navs", ["nav_category_id"], name: "index_cms_navs_on_nav_category_id"

  create_table "cms_page_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "date"
    t.boolean  "publish"
    t.string   "thumb"
    t.integer  "page_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cms_pages", ["page_category_id"], name: "index_cms_pages_on_page_category_id"

  create_table "cms_post_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "resume"
    t.text     "content"
    t.date     "date"
    t.boolean  "publish"
    t.boolean  "slider"
    t.string   "thumb"
    t.integer  "post_category_id"
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

  create_table "concourse_candidate_informations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "field_type"
    t.string   "field_name"
    t.text     "field_value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_candidate_informations", ["candidate_id"], name: "index_concourse_candidate_informations_on_candidate_id"

  create_table "concourse_candidate_uploads", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "field_type"
    t.string   "field_name"
    t.string   "field_value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_candidate_uploads", ["candidate_id"], name: "index_concourse_candidate_uploads_on_candidate_id"

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
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "concourse_candidates", ["city_id"], name: "index_concourse_candidates_on_city_id"
  add_index "concourse_candidates", ["project_id"], name: "index_concourse_candidates_on_project_id"
  add_index "concourse_candidates", ["state_id"], name: "index_concourse_candidates_on_state_id"

  create_table "concourse_navs", force: :cascade do |t|
    t.string   "link"
    t.integer  "target"
    t.string   "external_link"
    t.integer  "page_id"
    t.integer  "project_id"
    t.integer  "page_action"
    t.boolean  "publish"
    t.integer  "order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "concourse_navs", ["page_id"], name: "index_concourse_navs_on_page_id"
  add_index "concourse_navs", ["project_id"], name: "index_concourse_navs_on_project_id"

  create_table "concourse_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "concourse_pages", ["project_id"], name: "index_concourse_pages_on_project_id"

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
    t.boolean  "status"
    t.boolean  "subscribe"
    t.boolean  "send_project"
    t.boolean  "registration_fee"
    t.float    "fee_value"
    t.integer  "project_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "concourse_projects", ["project_category_id"], name: "index_concourse_projects_on_project_category_id"

  create_table "patrimony_down_goods", force: :cascade do |t|
    t.string   "name"
    t.string   "number_process"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "good_id"
  end

  add_index "patrimony_down_goods", ["good_id"], name: "index_patrimony_down_goods_on_good_id"

  create_table "patrimony_drives", force: :cascade do |t|
    t.date     "date_drive"
    t.integer  "sector_id"
    t.integer  "user_id"
    t.integer  "good_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "patrimony_drives", ["good_id"], name: "index_patrimony_drives_on_good_id"
  add_index "patrimony_drives", ["sector_id"], name: "index_patrimony_drives_on_sector_id"
  add_index "patrimony_drives", ["user_id"], name: "index_patrimony_drives_on_user_id"

  create_table "patrimony_goods", force: :cascade do |t|
    t.string   "code_goods"
    t.date     "date_acquisition"
    t.boolean  "status"
    t.integer  "sector_id"
    t.integer  "user_id"
    t.integer  "material_id"
    t.integer  "property_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "patrimony_goods", ["material_id"], name: "index_patrimony_goods_on_material_id"
  add_index "patrimony_goods", ["property_id"], name: "index_patrimony_goods_on_property_id"
  add_index "patrimony_goods", ["sector_id"], name: "index_patrimony_goods_on_sector_id"
  add_index "patrimony_goods", ["user_id"], name: "index_patrimony_goods_on_user_id"

  create_table "patrimony_materials", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "type_material_id"
    t.boolean  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "patrimony_materials", ["type_material_id"], name: "index_patrimony_materials_on_type_material_id"

  create_table "patrimony_properties", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patrimony_serial_numbers", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "good_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "patrimony_serial_numbers", ["good_id"], name: "index_patrimony_serial_numbers_on_good_id"

  create_table "patrimony_type_materials", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "percentage"
    t.integer  "life_cycle"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "person_branch_lines", force: :cascade do |t|
    t.string   "telephone"
    t.string   "description"
    t.boolean  "status"
    t.integer  "sector_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "person_branch_lines", ["sector_id"], name: "index_person_branch_lines_on_sector_id"

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
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "branch_line_id"
    t.integer  "job_id"
    t.integer  "sector_origin_id"
    t.integer  "sector_current_id"
    t.integer  "user_responsible_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["branch_line_id"], name: "index_users_on_branch_line_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["job_id"], name: "index_users_on_job_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["sector_current_id"], name: "index_users_on_sector_current_id"
  add_index "users", ["sector_origin_id"], name: "index_users_on_sector_origin_id"
  add_index "users", ["user_responsible_id"], name: "index_users_on_user_responsible_id"

end
