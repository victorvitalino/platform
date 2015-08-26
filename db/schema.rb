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

ActiveRecord::Schema.define(version: 20150821171350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_cities", force: :cascade do |t|
    t.string   "name"
    t.boolean  "capital",    default: true
    t.integer  "state_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "address_cities", ["state_id"], name: "index_address_cities_on_state_id", using: :btree

  create_table "address_notary_offices", force: :cascade do |t|
    t.string   "unit_code"
    t.string   "office"
    t.date     "date_code"
    t.date     "date_contract"
    t.string   "code_contract"
    t.date     "office_contract"
    t.date     "date_petition"
    t.date     "date_signature"
    t.date     "date_anoreg"
    t.date     "date_devolution"
    t.string   "requeriment"
    t.date     "date_requeriment"
    t.string   "declaratory_act_number"
    t.string   "rejection_number"
    t.integer  "unit_id"
    t.date     "date_act_declaratory"
    t.date     "date_act_rejection"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "address_notary_offices", ["unit_id"], name: "index_address_notary_offices_on_unit_id", using: :btree

  create_table "address_registry_units", force: :cascade do |t|
    t.integer  "situation"
    t.boolean  "status"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "address_registry_units", ["unit_id"], name: "index_address_registry_units_on_unit_id", using: :btree

  create_table "address_situation_units", force: :cascade do |t|
    t.string   "description"
    t.string   "code"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "address_states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_units", force: :cascade do |t|
    t.string   "acron_block"
    t.string   "block"
    t.string   "acron_group"
    t.string   "group"
    t.string   "unit"
    t.string   "cep_unit"
    t.string   "area"
    t.string   "complete_address"
    t.string   "burgh"
    t.boolean  "sefaz"
    t.boolean  "donate"
    t.date     "date_donate"
    t.date     "date_iptu"
    t.string   "registration_iptu"
    t.string   "certificate"
    t.integer  "situation_unit_id"
    t.integer  "type_use_unit_id"
    t.integer  "city_id"
    t.integer  "program"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "address_units", ["city_id"], name: "index_address_units_on_city_id", using: :btree
  add_index "address_units", ["situation_unit_id"], name: "index_address_units_on_situation_unit_id", using: :btree
  add_index "address_units", ["type_use_unit_id"], name: "index_address_units_on_type_use_unit_id", using: :btree

  create_table "attendance_attendants", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendance_attendants", ["sector_id"], name: "index_attendance_attendants_on_sector_id", using: :btree
  add_index "attendance_attendants", ["staff_id"], name: "index_attendance_attendants_on_staff_id", using: :btree

  create_table "attendance_codes", force: :cascade do |t|
    t.integer  "number"
    t.boolean  "preference"
    t.integer  "station_id"
    t.integer  "counter_id"
    t.datetime "start"
    t.datetime "end"
    t.integer  "attendant_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "attendance_codes", ["attendant_id"], name: "index_attendance_codes_on_attendant_id", using: :btree
  add_index "attendance_codes", ["counter_id"], name: "index_attendance_codes_on_counter_id", using: :btree
  add_index "attendance_codes", ["station_id"], name: "index_attendance_codes_on_station_id", using: :btree

  create_table "attendance_counters", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "subject_id"
    t.boolean  "preference"
    t.boolean  "status"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendance_counters", ["station_id"], name: "index_attendance_counters_on_station_id", using: :btree
  add_index "attendance_counters", ["subject_id"], name: "index_attendance_counters_on_subject_id", using: :btree

  create_table "attendance_station_attendants", force: :cascade do |t|
    t.integer  "attendant_id"
    t.integer  "station_id"
    t.boolean  "status"
    t.boolean  "supervisor"
    t.integer  "counter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "attendance_station_attendants", ["attendant_id"], name: "index_attendance_station_attendants_on_attendant_id", using: :btree
  add_index "attendance_station_attendants", ["counter_id"], name: "index_attendance_station_attendants_on_counter_id", using: :btree
  add_index "attendance_station_attendants", ["station_id"], name: "index_attendance_station_attendants_on_station_id", using: :btree

  create_table "attendance_stations", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "station_type"
    t.integer  "convocation_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "attendance_stations", ["city_id"], name: "index_attendance_stations_on_city_id", using: :btree
  add_index "attendance_stations", ["convocation_id"], name: "index_attendance_stations_on_convocation_id", using: :btree

  create_table "attendance_subjects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_adjuct_cadastres", force: :cascade do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "special_condition_id"
    t.boolean  "flag_special_condition", default: false
    t.string   "cep"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "address"
    t.string   "adjunt_address"
    t.string   "number_address"
    t.float    "income"
    t.string   "work"
    t.string   "cep_work"
    t.integer  "city_work_id"
    t.integer  "state_work_id"
    t.string   "address_work"
    t.string   "adjunt_address_work"
    t.string   "number_address_work"
    t.string   "nis"
    t.string   "cid"
    t.integer  "cadastre_id"
    t.integer  "civil_state_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "candidate_adjuct_cadastres", ["cadastre_id"], name: "index_candidate_adjuct_cadastres_on_cadastre_id", using: :btree
  add_index "candidate_adjuct_cadastres", ["city_id"], name: "index_candidate_adjuct_cadastres_on_city_id", using: :btree
  add_index "candidate_adjuct_cadastres", ["city_work_id"], name: "index_candidate_adjuct_cadastres_on_city_work_id", using: :btree
  add_index "candidate_adjuct_cadastres", ["civil_state_id"], name: "index_candidate_adjuct_cadastres_on_civil_state_id", using: :btree
  add_index "candidate_adjuct_cadastres", ["special_condition_id"], name: "index_candidate_adjuct_cadastres_on_special_condition_id", using: :btree
  add_index "candidate_adjuct_cadastres", ["state_id"], name: "index_candidate_adjuct_cadastres_on_state_id", using: :btree
  add_index "candidate_adjuct_cadastres", ["state_work_id"], name: "index_candidate_adjuct_cadastres_on_state_work_id", using: :btree

  create_table "candidate_attendance_cadastres", force: :cascade do |t|
    t.integer  "adjuct_cadastre_id"
    t.integer  "convocation_id"
    t.integer  "attendance_status_id"
    t.boolean  "status",               default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "candidate_attendance_cadastres", ["adjuct_cadastre_id"], name: "index_candidate_attendance_cadastres_on_adjuct_cadastre_id", using: :btree
  add_index "candidate_attendance_cadastres", ["attendance_status_id"], name: "index_candidate_attendance_cadastres_on_attendance_status_id", using: :btree
  add_index "candidate_attendance_cadastres", ["convocation_id"], name: "index_candidate_attendance_cadastres_on_convocation_id", using: :btree

  create_table "candidate_attendance_statuses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_cadastres", force: :cascade do |t|
    t.string   "cpf"
    t.integer  "gender",      default: 0
    t.date     "born"
    t.string   "born_uf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "place_birth"
    t.date     "arrival_df"
    t.string   "seqcad"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "candidate_civil_states", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_convocations", force: :cascade do |t|
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.integer  "quantity"
    t.text     "discretion"
    t.boolean  "stauts",            default: true
    t.string   "legacy_pontuation"
    t.integer  "pontuation_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "candidate_convocations", ["pontuation_id"], name: "index_candidate_convocations_on_pontuation_id", using: :btree

  create_table "candidate_special_conditions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cms_nav_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  add_index "cms_navs", ["category_id"], name: "index_cms_navs_on_category_id", using: :btree
  add_index "cms_navs", ["link_page_id"], name: "index_cms_navs_on_link_page_id", using: :btree
  add_index "cms_navs", ["link_post_id"], name: "index_cms_navs_on_link_post_id", using: :btree

  create_table "cms_page_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  add_index "cms_pages", ["page_category_id"], name: "index_cms_pages_on_page_category_id", using: :btree

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

  add_index "cms_posts", ["post_category_id"], name: "index_cms_posts_on_post_category_id", using: :btree

  create_table "concourse_candidate_messages", force: :cascade do |t|
    t.integer  "candidate_id"
    t.text     "message"
    t.integer  "message_type"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_candidate_messages", ["candidate_id"], name: "index_concourse_candidate_messages_on_candidate_id", using: :btree

  create_table "concourse_candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "rg"
    t.integer  "gender"
    t.date     "born"
    t.string   "cpf"
    t.string   "address"
    t.string   "burgh"
    t.string   "city"
    t.string   "cep"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "email"
    t.string   "fantasy_name"
    t.string   "social_reason"
    t.string   "cnpj"
    t.string   "password"
    t.boolean  "terms_use"
    t.integer  "state_id"
    t.integer  "subscribe_id"
    t.text     "observation"
    t.integer  "status",        default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "concourse_candidates", ["state_id"], name: "index_concourse_candidates_on_state_id", using: :btree
  add_index "concourse_candidates", ["subscribe_id"], name: "index_concourse_candidates_on_subscribe_id", using: :btree

  create_table "concourse_consults", force: :cascade do |t|
    t.text     "content"
    t.boolean  "status",     default: false
    t.boolean  "terms_use",  default: false
    t.integer  "project_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "concourse_consults", ["project_id"], name: "index_concourse_consults_on_project_id", using: :btree

  create_table "concourse_fields", force: :cascade do |t|
    t.integer  "subscribe_id"
    t.integer  "participation_id"
    t.string   "label"
    t.integer  "field_type"
    t.boolean  "required"
    t.boolean  "unique"
    t.integer  "max_size"
    t.string   "file_white_list"
    t.boolean  "only_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "concourse_fields", ["participation_id"], name: "index_concourse_fields_on_participation_id", using: :btree
  add_index "concourse_fields", ["subscribe_id"], name: "index_concourse_fields_on_subscribe_id", using: :btree

  create_table "concourse_navs", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "page_id"
    t.string   "label"
    t.string   "url"
    t.integer  "target"
    t.integer  "action"
    t.boolean  "publish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "concourse_navs", ["page_id"], name: "index_concourse_navs_on_page_id", using: :btree
  add_index "concourse_navs", ["project_id"], name: "index_concourse_navs_on_project_id", using: :btree

  create_table "concourse_pages", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "concourse_pages", ["project_id"], name: "index_concourse_pages_on_project_id", using: :btree
  add_index "concourse_pages", ["slug"], name: "index_concourse_pages_on_slug", unique: true, using: :btree

  create_table "concourse_participations", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.date     "start"
    t.date     "end"
    t.boolean  "publish"
    t.text     "observation"
    t.integer  "subscribe_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_participations", ["project_id"], name: "index_concourse_participations_on_project_id", using: :btree
  add_index "concourse_participations", ["subscribe_id"], name: "index_concourse_participations_on_subscribe_id", using: :btree

  create_table "concourse_projects", force: :cascade do |t|
    t.string   "title"
    t.text     "mini_description"
    t.text     "apresentation"
    t.date     "start"
    t.date     "end"
    t.boolean  "publish"
    t.boolean  "status"
    t.string   "image_header"
    t.string   "image_logo"
    t.string   "image_footer"
    t.string   "image_slider"
    t.boolean  "slider"
    t.boolean  "consultation"
    t.string   "slug"
    t.integer  "step",             default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "concourse_subscribes", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.boolean  "fee"
    t.integer  "type_slip_id"
    t.date     "start"
    t.date     "end"
    t.boolean  "publish"
    t.text     "observation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_subscribes", ["project_id"], name: "index_concourse_subscribes_on_project_id", using: :btree
  add_index "concourse_subscribes", ["type_slip_id"], name: "index_concourse_subscribes_on_type_slip_id", using: :btree

  create_table "finance_payment_guides", force: :cascade do |t|
    t.integer  "type_guide_id"
    t.float    "value"
    t.date     "deadline"
    t.date     "paid"
    t.date     "credited"
    t.float    "value_paid"
    t.string   "barcode"
    t.string   "our_number"
    t.string   "observation"
    t.string   "name"
    t.string   "cpf"
    t.boolean  "status",        default: false
    t.integer  "model_guide",   default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "finance_payment_guides", ["type_guide_id"], name: "index_finance_payment_guides_on_type_guide_id", using: :btree

  create_table "finance_type_guides", force: :cascade do |t|
    t.string   "title"
    t.boolean  "publish",    default: true
    t.float    "value"
    t.string   "code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "helpdesk_attendants", force: :cascade do |t|
    t.string   "code"
    t.integer  "type_attendant"
    t.integer  "staff_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "helpdesk_attendants", ["staff_id"], name: "index_helpdesk_attendants_on_staff_id", using: :btree

  create_table "helpdesk_monitor_service_orders", force: :cascade do |t|
    t.text     "appointment"
    t.string   "attachment"
    t.boolean  "status"
    t.integer  "order_service_id"
    t.integer  "staff_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "helpdesk_monitor_service_orders", ["order_service_id"], name: "index_helpdesk_monitor_service_orders_on_order_service_id", using: :btree
  add_index "helpdesk_monitor_service_orders", ["staff_id"], name: "index_helpdesk_monitor_service_orders_on_staff_id", using: :btree

  create_table "helpdesk_order_services", force: :cascade do |t|
    t.integer  "number"
    t.integer  "number_increment"
    t.integer  "qualification"
    t.string   "subject"
    t.integer  "category"
    t.integer  "status"
    t.date     "deadline"
    t.datetime "finalized_in"
    t.integer  "sector_id"
    t.integer  "branch_line_id"
    t.integer  "staff_id"
    t.integer  "opened_by_id"
    t.integer  "responsible_id"
    t.integer  "good_id"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "helpdesk_order_services", ["branch_line_id"], name: "index_helpdesk_order_services_on_branch_line_id", using: :btree
  add_index "helpdesk_order_services", ["category_id"], name: "index_helpdesk_order_services_on_category_id", using: :btree
  add_index "helpdesk_order_services", ["good_id"], name: "index_helpdesk_order_services_on_good_id", using: :btree
  add_index "helpdesk_order_services", ["opened_by_id"], name: "index_helpdesk_order_services_on_opened_by_id", using: :btree
  add_index "helpdesk_order_services", ["responsible_id"], name: "index_helpdesk_order_services_on_responsible_id", using: :btree
  add_index "helpdesk_order_services", ["sector_id"], name: "index_helpdesk_order_services_on_sector_id", using: :btree
  add_index "helpdesk_order_services", ["staff_id"], name: "index_helpdesk_order_services_on_staff_id", using: :btree

  create_table "juridical_action_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_activities", force: :cascade do |t|
    t.integer  "document_type_id"
    t.integer  "action_type_id"
    t.integer  "local_instance_id"
    t.date     "date_distribution"
    t.date     "deadline"
    t.string   "days"
    t.date     "end_date"
    t.text     "complemet"
    t.integer  "user_id"
    t.boolean  "status"
    t.string   "monitoring_type"
    t.string   "attachment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "juridical_activities", ["action_type_id"], name: "index_juridical_activities_on_action_type_id", using: :btree
  add_index "juridical_activities", ["document_type_id"], name: "index_juridical_activities_on_document_type_id", using: :btree
  add_index "juridical_activities", ["local_instance_id"], name: "index_juridical_activities_on_local_instance_id", using: :btree
  add_index "juridical_activities", ["user_id"], name: "index_juridical_activities_on_user_id", using: :btree

  create_table "juridical_atividades", force: :cascade do |t|
    t.integer  "document_type_id"
    t.integer  "action_type_id"
    t.integer  "local_instance_id"
    t.date     "date_distribution"
    t.date     "deadline"
    t.string   "days"
    t.date     "end_date"
    t.text     "complemet"
    t.integer  "user_id"
    t.boolean  "status"
    t.string   "monitoring_type"
    t.string   "attachment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "juridical_atividades", ["action_type_id"], name: "index_juridical_atividades_on_action_type_id", using: :btree
  add_index "juridical_atividades", ["document_type_id"], name: "index_juridical_atividades_on_document_type_id", using: :btree
  add_index "juridical_atividades", ["user_id"], name: "index_juridical_atividades_on_user_id", using: :btree

  create_table "juridical_instances", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_local_instances", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "instance_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "juridical_local_instances", ["instance_id"], name: "index_juridical_local_instances_on_instance_id", using: :btree

  create_table "juridical_process_monitorings", force: :cascade do |t|
    t.string   "number_lawsuit"
    t.string   "number_administrative_process"
    t.string   "organ"
    t.integer  "action_type_id"
    t.string   "value_cause"
    t.integer  "local_instance_id"
    t.string   "part"
    t.integer  "lawyer_responsible_id"
    t.text     "complemet"
    t.boolean  "status"
    t.date     "initial_date"
    t.date     "end_date"
    t.integer  "process_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "juridical_process_monitorings", ["action_type_id"], name: "index_juridical_process_monitorings_on_action_type_id", using: :btree
  add_index "juridical_process_monitorings", ["lawyer_responsible_id"], name: "index_juridical_process_monitorings_on_lawyer_responsible_id", using: :btree
  add_index "juridical_process_monitorings", ["local_instance_id"], name: "index_juridical_process_monitorings_on_local_instance_id", using: :btree

  create_table "patrimony_down_goods", force: :cascade do |t|
    t.string   "name"
    t.string   "number_process"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "good_id"
  end

  add_index "patrimony_down_goods", ["good_id"], name: "index_patrimony_down_goods_on_good_id", using: :btree

  create_table "patrimony_drives", force: :cascade do |t|
    t.date     "date_drive"
    t.integer  "sector_id"
    t.integer  "user_id"
    t.integer  "good_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "patrimony_drives", ["good_id"], name: "index_patrimony_drives_on_good_id", using: :btree
  add_index "patrimony_drives", ["sector_id"], name: "index_patrimony_drives_on_sector_id", using: :btree
  add_index "patrimony_drives", ["user_id"], name: "index_patrimony_drives_on_user_id", using: :btree

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

  add_index "patrimony_goods", ["material_id"], name: "index_patrimony_goods_on_material_id", using: :btree
  add_index "patrimony_goods", ["property_id"], name: "index_patrimony_goods_on_property_id", using: :btree
  add_index "patrimony_goods", ["sector_id"], name: "index_patrimony_goods_on_sector_id", using: :btree
  add_index "patrimony_goods", ["user_id"], name: "index_patrimony_goods_on_user_id", using: :btree

  create_table "patrimony_materials", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "type_material_id"
    t.boolean  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "patrimony_materials", ["type_material_id"], name: "index_patrimony_materials_on_type_material_id", using: :btree

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

  add_index "patrimony_serial_numbers", ["good_id"], name: "index_patrimony_serial_numbers_on_good_id", using: :btree

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

  add_index "person_branch_lines", ["sector_id"], name: "index_person_branch_lines_on_sector_id", using: :btree

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
    t.string   "prefex"
    t.integer  "father_id"
    t.integer  "responsible_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "person_sectors", ["father_id"], name: "index_person_sectors_on_father_id", using: :btree
  add_index "person_sectors", ["responsible_id"], name: "index_person_sectors_on_responsible_id", using: :btree

  create_table "person_staff_permissions", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "system_permission_id"
    t.integer  "system_id"
    t.boolean  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "person_staff_permissions", ["staff_id"], name: "index_person_staff_permissions_on_staff_id", using: :btree
  add_index "person_staff_permissions", ["system_id"], name: "index_person_staff_permissions_on_system_id", using: :btree
  add_index "person_staff_permissions", ["system_permission_id"], name: "index_person_staff_permissions_on_system_permission_id", using: :btree

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
    t.date     "date_shutdown"
    t.boolean  "attendant"
    t.boolean  "wekeend"
    t.boolean  "status",              default: true
    t.boolean  "administrator",       default: true
    t.integer  "gender"
    t.integer  "branch_line_id"
    t.integer  "job_id"
    t.integer  "sector_origin_id"
    t.integer  "sector_current_id"
    t.integer  "user_responsible_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "person_staffs", ["branch_line_id"], name: "index_person_staffs_on_branch_line_id", using: :btree
  add_index "person_staffs", ["job_id"], name: "index_person_staffs_on_job_id", using: :btree
  add_index "person_staffs", ["sector_current_id"], name: "index_person_staffs_on_sector_current_id", using: :btree
  add_index "person_staffs", ["sector_origin_id"], name: "index_person_staffs_on_sector_origin_id", using: :btree
  add_index "person_staffs", ["user_responsible_id"], name: "index_person_staffs_on_user_responsible_id", using: :btree

  create_table "person_system_permissions", force: :cascade do |t|
    t.string   "action"
    t.integer  "code"
    t.boolean  "status"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "person_system_permissions", ["system_id"], name: "index_person_system_permissions_on_system_id", using: :btree

  create_table "person_systems", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "protocol_allotments", force: :cascade do |t|
    t.text     "description"
    t.integer  "priority"
    t.date     "replay_date"
    t.integer  "amount_docs"
    t.boolean  "status",      default: false
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "protocol_allotments", ["sector_id"], name: "index_protocol_allotments_on_sector_id", using: :btree
  add_index "protocol_allotments", ["staff_id"], name: "index_protocol_allotments_on_staff_id", using: :btree

  create_table "protocol_assessments", force: :cascade do |t|
    t.integer  "number"
    t.integer  "year"
    t.integer  "prefex"
    t.string   "document_number"
    t.string   "external_number"
    t.string   "requesting_unit"
    t.string   "external_agency"
    t.string   "recipient"
    t.string   "address"
    t.string   "cpf"
    t.string   "cnpj"
    t.string   "sign_by"
    t.text     "observation"
    t.text     "description_subject"
    t.integer  "document_type_id"
    t.integer  "subject_id"
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "protocol_assessments", ["document_type_id"], name: "index_protocol_assessments_on_document_type_id", using: :btree
  add_index "protocol_assessments", ["sector_id"], name: "index_protocol_assessments_on_sector_id", using: :btree
  add_index "protocol_assessments", ["staff_id"], name: "index_protocol_assessments_on_staff_id", using: :btree
  add_index "protocol_assessments", ["subject_id"], name: "index_protocol_assessments_on_subject_id", using: :btree

  create_table "protocol_attach_documents", force: :cascade do |t|
    t.integer  "document_father_id"
    t.integer  "document_child_id"
    t.integer  "attach_type"
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "protocol_attach_documents", ["document_child_id"], name: "index_protocol_attach_documents_on_document_child_id", using: :btree
  add_index "protocol_attach_documents", ["document_father_id"], name: "index_protocol_attach_documents_on_document_father_id", using: :btree
  add_index "protocol_attach_documents", ["sector_id"], name: "index_protocol_attach_documents_on_sector_id", using: :btree
  add_index "protocol_attach_documents", ["staff_id"], name: "index_protocol_attach_documents_on_staff_id", using: :btree

  create_table "protocol_conducts", force: :cascade do |t|
    t.text     "description"
    t.integer  "conduct_type"
    t.integer  "assessment_id"
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.integer  "allotment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "protocol_conducts", ["allotment_id"], name: "index_protocol_conducts_on_allotment_id", using: :btree
  add_index "protocol_conducts", ["assessment_id"], name: "index_protocol_conducts_on_assessment_id", using: :btree
  add_index "protocol_conducts", ["sector_id"], name: "index_protocol_conducts_on_sector_id", using: :btree
  add_index "protocol_conducts", ["staff_id"], name: "index_protocol_conducts_on_staff_id", using: :btree

  create_table "protocol_digital_documents", force: :cascade do |t|
    t.integer  "page_number"
    t.string   "doc_path"
    t.integer  "assessment_id"
    t.integer  "staff_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "protocol_digital_documents", ["assessment_id"], name: "index_protocol_digital_documents_on_assessment_id", using: :btree
  add_index "protocol_digital_documents", ["staff_id"], name: "index_protocol_digital_documents_on_staff_id", using: :btree

  create_table "protocol_document_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "prefex"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "protocol_locations", force: :cascade do |t|
    t.string   "shelf"
    t.string   "pile"
    t.string   "box"
    t.text     "observation"
    t.integer  "assessment_id"
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "protocol_locations", ["assessment_id"], name: "index_protocol_locations_on_assessment_id", using: :btree
  add_index "protocol_locations", ["sector_id"], name: "index_protocol_locations_on_sector_id", using: :btree
  add_index "protocol_locations", ["staff_id"], name: "index_protocol_locations_on_staff_id", using: :btree

  create_table "protocol_subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "regularization_requeriments", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "email"
    t.string   "nationality"
    t.integer  "marital_status"
    t.integer  "gender"
    t.date     "born"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "complete_address"
    t.float    "income"
    t.string   "spouse_name"
    t.string   "spouse_cpf"
    t.boolean  "owner",            default: false
    t.integer  "unit_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "regularization_requeriments", ["unit_id"], name: "index_regularization_requeriments_on_unit_id", using: :btree

  create_table "regularization_schedule_agendas", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.time     "hour_start"
    t.time     "hour_end"
    t.boolean  "publish"
    t.integer  "city_id"
    t.integer  "station_id"
    t.integer  "quantity_attendants"
    t.integer  "time_attendant"
    t.boolean  "lunch"
    t.time     "lunch_start"
    t.time     "lunch_end"
    t.integer  "lunch_attendants"
    t.integer  "lunch_time_attendant"
    t.string   "validate_sql"
    t.integer  "validate_type"
    t.boolean  "validate_agenda"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "regularization_schedule_agendas", ["city_id"], name: "index_regularization_schedule_agendas_on_city_id", using: :btree
  add_index "regularization_schedule_agendas", ["station_id"], name: "index_regularization_schedule_agendas_on_station_id", using: :btree

  create_table "regularization_schedule_schedules", force: :cascade do |t|
    t.integer  "agenda_id"
    t.integer  "requeriment_id"
    t.string   "cpf"
    t.boolean  "status"
    t.date     "date_schedule"
    t.time     "hour_schedule"
    t.text     "observation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "regularization_schedule_schedules", ["agenda_id"], name: "index_regularization_schedule_schedules_on_agenda_id", using: :btree
  add_index "regularization_schedule_schedules", ["requeriment_id"], name: "index_regularization_schedule_schedules_on_requeriment_id", using: :btree

  create_table "user_candidates", force: :cascade do |t|
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
    t.text     "unique_session_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "user_candidates", ["account_id", "account_type"], name: "index_user_candidates_on_account_id_and_account_type", using: :btree
  add_index "user_candidates", ["reset_password_token"], name: "index_user_candidates_on_reset_password_token", unique: true, using: :btree
  add_index "user_candidates", ["username"], name: "index_user_candidates_on_username", unique: true, using: :btree

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
    t.text     "unique_session_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["account_id", "account_type"], name: "index_users_on_account_id_and_account_type", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
