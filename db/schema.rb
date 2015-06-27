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

ActiveRecord::Schema.define(version: 20150627142829) do

  create_table "cms_nav_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_navs", force: :cascade do |t|
    t.string   "name"
    t.integer  "target"
    t.integer  "order"
    t.string   "link_external"
    t.integer  "type_nav"
    t.integer  "link_page_id"
    t.integer  "link_post_id"
    t.boolean  "publish"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "cms_navs", ["category_id"], name: "index_cms_navs_on_category_id"
  add_index "cms_navs", ["link_page_id"], name: "index_cms_navs_on_link_page_id"
  add_index "cms_navs", ["link_post_id"], name: "index_cms_navs_on_link_post_id"

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
    t.string   "photo_author"
    t.string   "photo_description"
    t.boolean  "active_photo"
    t.string   "author"
    t.string   "link"
    t.string   "thumbnail"
    t.string   "label_link"
    t.integer  "page_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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
    t.string   "photo_author"
    t.string   "photo_description"
    t.boolean  "active_photo"
    t.string   "author"
    t.string   "link"
    t.integer  "post_category_id"
    t.string   "thumbnail"
    t.string   "label_link"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "cms_posts", ["post_category_id"], name: "index_cms_posts_on_post_category_id"

  create_table "concourse_candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "telphone"
    t.string   "telphone_optional"
    t.string   "celphone"
    t.string   "cep"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "email"
    t.integer  "sex"
    t.boolean  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "concourse_candidates", ["city_id"], name: "index_concourse_candidates_on_city_id"
  add_index "concourse_candidates", ["state_id"], name: "index_concourse_candidates_on_state_id"

  create_table "concourse_enrollment_candidates", force: :cascade do |t|
    t.integer  "enrollment_id"
    t.integer  "candidate_id"
    t.integer  "project_id"
    t.text     "properties"
    t.boolean  "validated"
    t.boolean  "payment"
    t.integer  "status"
    t.text     "observation_validated"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "concourse_enrollment_candidates", ["candidate_id"], name: "index_concourse_enrollment_candidates_on_candidate_id"
  add_index "concourse_enrollment_candidates", ["enrollment_id"], name: "index_concourse_enrollment_candidates_on_enrollment_id"
  add_index "concourse_enrollment_candidates", ["project_id"], name: "index_concourse_enrollment_candidates_on_project_id"

  create_table "concourse_enrollment_fields", force: :cascade do |t|
    t.integer  "enrollment_id"
    t.string   "name"
    t.string   "code"
    t.integer  "field_type"
    t.boolean  "required"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "concourse_enrollment_fields", ["enrollment_id"], name: "index_concourse_enrollment_fields_on_enrollment_id"

  create_table "concourse_enrollments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.boolean  "status"
    t.boolean  "fee"
    t.decimal  "value_fee"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "concourse_enrollments", ["project_id"], name: "index_concourse_enrollments_on_project_id"

  create_table "concourse_navs", force: :cascade do |t|
    t.string   "name"
    t.integer  "page_id"
    t.integer  "project_id"
    t.string   "external_url"
    t.integer  "target"
    t.integer  "action"
    t.integer  "father_id"
    t.boolean  "publish"
    t.integer  "order"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_navs", ["father_id"], name: "index_concourse_navs_on_father_id"
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

  create_table "concourse_participation_candidates", force: :cascade do |t|
    t.integer  "participation_id"
    t.integer  "candidate_id"
    t.integer  "project_id"
    t.text     "candidate_attributes"
    t.integer  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "concourse_participation_candidates", ["candidate_id"], name: "index_concourse_participation_candidates_on_candidate_id"
  add_index "concourse_participation_candidates", ["participation_id"], name: "index_concourse_participation_candidates_on_participation_id"
  add_index "concourse_participation_candidates", ["project_id"], name: "index_concourse_participation_candidates_on_project_id"

  create_table "concourse_participation_fields", force: :cascade do |t|
    t.integer  "participation_id"
    t.string   "name"
    t.integer  "field_type"
    t.boolean  "required"
    t.boolean  "unique"
    t.integer  "length"
    t.string   "validate_regex"
    t.boolean  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "concourse_participation_fields", ["participation_id"], name: "index_concourse_participation_fields_on_participation_id"

  create_table "concourse_participations", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "status"
    t.date     "start"
    t.date     "end"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "concourse_participations", ["project_id"], name: "index_concourse_participations_on_project_id"

  create_table "concourse_project_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concourse_projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.string   "header"
    t.string   "footer"
    t.date     "start"
    t.date     "end"
    t.boolean  "open"
    t.integer  "project_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "concourse_projects", ["project_category_id"], name: "index_concourse_projects_on_project_category_id"

  create_table "concourse_subscribe_actions", force: :cascade do |t|
    t.integer  "enrollment_candidate_id"
    t.text     "content"
    t.boolean  "status"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "concourse_subscribe_actions", ["enrollment_candidate_id"], name: "index_concourse_subscribe_actions_on_enrollment_candidate_id"

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

  create_table "person_staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "code"
    t.string   "blood_type"
    t.date     "born"
    t.string   "avatar"
    t.string   "curriculum"
    t.string   "email",               default: "",   null: false
    t.time     "start_hour"
    t.time     "end_hour"
    t.date     "date_contract"
    t.boolean  "attendant"
    t.boolean  "wekeend"
    t.boolean  "status",              default: true
    t.integer  "branch_line_id"
    t.integer  "job_id"
    t.integer  "sector_origin_id"
    t.integer  "sector_current_id"
    t.integer  "user_responsible_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "person_staffs", ["branch_line_id"], name: "index_person_staffs_on_branch_line_id"
  add_index "person_staffs", ["job_id"], name: "index_person_staffs_on_job_id"
  add_index "person_staffs", ["sector_current_id"], name: "index_person_staffs_on_sector_current_id"
  add_index "person_staffs", ["sector_origin_id"], name: "index_person_staffs_on_sector_origin_id"
  add_index "person_staffs", ["user_responsible_id"], name: "index_person_staffs_on_user_responsible_id"

  create_table "person_system_permissions", force: :cascade do |t|
    t.string   "action"
    t.integer  "code"
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

  create_table "person_user_permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "system_permission_id"
    t.boolean  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "person_user_permissions", ["system_permission_id"], name: "index_person_user_permissions_on_system_permission_id"
  add_index "person_user_permissions", ["user_id"], name: "index_person_user_permissions_on_user_id"

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
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "account_id"
    t.string   "account_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["account_id", "account_type"], name: "index_users_on_account_id_and_account_type"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
