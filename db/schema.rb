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

ActiveRecord::Schema.define(version: 20160811121912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "dblink"

  create_table "action_atuation_areas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_cadastres", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "address"
    t.string   "nationality"
    t.string   "password"
    t.string   "email"
    t.string   "phone"
    t.date     "born"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profession_id"
    t.integer  "formation_area_id"
    t.integer  "atuation_area_id"
  end

  add_index "action_cadastres", ["atuation_area_id"], name: "index_action_cadastres_on_atuation_area_id", using: :btree
  add_index "action_cadastres", ["city_id"], name: "index_action_cadastres_on_city_id", using: :btree
  add_index "action_cadastres", ["formation_area_id"], name: "index_action_cadastres_on_formation_area_id", using: :btree
  add_index "action_cadastres", ["profession_id"], name: "index_action_cadastres_on_profession_id", using: :btree
  add_index "action_cadastres", ["state_id"], name: "index_action_cadastres_on_state_id", using: :btree

  create_table "action_formation_areas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_inscriptions", force: :cascade do |t|
    t.integer  "social_event_id"
    t.integer  "cadastre_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "action_inscriptions", ["cadastre_id"], name: "index_action_inscriptions_on_cadastre_id", using: :btree
  add_index "action_inscriptions", ["social_event_id"], name: "index_action_inscriptions_on_social_event_id", using: :btree

  create_table "action_professions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_social_events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.text     "description"
    t.integer  "situation"
    t.integer  "localization_id"
    t.integer  "city_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "status"
    t.string   "photo"
    t.string   "thumb"
    t.string   "hour"
    t.string   "district"
  end

  add_index "action_social_events", ["city_id"], name: "index_action_social_events_on_city_id", using: :btree
  add_index "action_social_events", ["localization_id"], name: "index_action_social_events_on_localization_id", using: :btree

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
    t.string   "office_contract"
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
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "project_enterprise_id"
    t.string   "urb"
    t.integer  "control_number"
    t.string   "latlng_block"
    t.string   "latlng_group"
    t.string   "latlng_unit"
    t.string   "latlng_urb"
    t.string   "lat"
    t.string   "lng"
    t.string   "coordinate"
    t.boolean  "contract_delivered"
    t.datetime "contract_delivered_date"
  end

  add_index "address_units", ["city_id"], name: "index_address_units_on_city_id", using: :btree
  add_index "address_units", ["project_enterprise_id"], name: "index_address_units_on_firm_enterprise_id", using: :btree
  add_index "address_units", ["situation_unit_id"], name: "index_address_units_on_situation_unit_id", using: :btree
  add_index "address_units", ["type_use_unit_id"], name: "index_address_units_on_type_use_unit_id", using: :btree

  create_table "archive_files", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.string   "original_name"
    t.string   "description"
    t.string   "hash_name"
    t.string   "file_path"
    t.boolean  "deleted",          default: false
    t.integer  "staff_deleted_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "archive_files", ["deleted_at"], name: "index_archive_files_on_deleted_at", using: :btree
  add_index "archive_files", ["file_path"], name: "index_archive_files_on_file_path", unique: true, using: :btree
  add_index "archive_files", ["hash_name"], name: "index_archive_files_on_hash_name", unique: true, using: :btree
  add_index "archive_files", ["sector_id"], name: "index_archive_files_on_sector_id", using: :btree
  add_index "archive_files", ["staff_deleted_id"], name: "index_archive_files_on_staff_deleted_id", using: :btree
  add_index "archive_files", ["staff_id"], name: "index_archive_files_on_staff_id", using: :btree

  create_table "archive_images", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.string   "original_name"
    t.string   "description"
    t.string   "hash_name"
    t.string   "file_path"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "archive_images", ["file_path"], name: "index_archive_images_on_file_path", unique: true, using: :btree
  add_index "archive_images", ["hash_name"], name: "index_archive_images_on_hash_name", unique: true, using: :btree
  add_index "archive_images", ["sector_id"], name: "index_archive_images_on_sector_id", using: :btree
  add_index "archive_images", ["staff_id"], name: "index_archive_images_on_staff_id", using: :btree

  create_table "attendance_activities", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "activity_situation_id"
    t.integer  "staff_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "attendance_activities", ["activity_situation_id"], name: "index_attendance_activities_on_activity_situation_id", using: :btree
  add_index "attendance_activities", ["cadastre_id"], name: "index_attendance_activities_on_cadastre_id", using: :btree
  add_index "attendance_activities", ["staff_id"], name: "index_attendance_activities_on_staff_id", using: :btree

  create_table "attendance_activity_situations", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "attendance_cadastre_checklists", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "checklist_id"
    t.boolean  "authenticate", default: false
    t.integer  "staff_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "attendance_cadastre_checklists", ["cadastre_id"], name: "index_attendance_cadastre_checklists_on_cadastre_id", using: :btree
  add_index "attendance_cadastre_checklists", ["checklist_id"], name: "index_attendance_cadastre_checklists_on_checklist_id", using: :btree
  add_index "attendance_cadastre_checklists", ["staff_id"], name: "index_attendance_cadastre_checklists_on_staff_id", using: :btree

  create_table "attendance_cadastres", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "program_id"
    t.integer  "situation_id"
    t.integer  "staff_id"
    t.integer  "supervisor_id"
    t.integer  "attendance_type_id"
    t.integer  "schedule_id"
    t.datetime "start"
    t.datetime "end"
    t.integer  "status",             default: 0
    t.integer  "canceler_id"
    t.datetime "cancel_date"
    t.text     "cancel_observation"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "attendance_cadastres", ["attendance_type_id"], name: "index_attendance_cadastres_on_attendance_type_id", using: :btree
  add_index "attendance_cadastres", ["cadastre_id"], name: "index_attendance_cadastres_on_cadastre_id", using: :btree
  add_index "attendance_cadastres", ["cadastre_mirror_id"], name: "index_attendance_cadastres_on_cadastre_mirror_id", using: :btree
  add_index "attendance_cadastres", ["canceler_id"], name: "index_attendance_cadastres_on_canceler_id", using: :btree
  add_index "attendance_cadastres", ["program_id"], name: "index_attendance_cadastres_on_program_id", using: :btree
  add_index "attendance_cadastres", ["schedule_id"], name: "index_attendance_cadastres_on_schedule_id", using: :btree
  add_index "attendance_cadastres", ["situation_id"], name: "index_attendance_cadastres_on_situation_id", using: :btree
  add_index "attendance_cadastres", ["staff_id"], name: "index_attendance_cadastres_on_staff_id", using: :btree
  add_index "attendance_cadastres", ["supervisor_id"], name: "index_attendance_cadastres_on_supervisor_id", using: :btree

  create_table "attendance_checklist_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.integer  "program_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "attendance_checklist_types", ["program_id"], name: "index_attendance_checklist_types_on_program_id", using: :btree

  create_table "attendance_checklists", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",            default: true
    t.string   "code"
    t.integer  "checklist_type_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "attendance_checklists", ["checklist_type_id"], name: "index_attendance_checklists_on_checklist_type_id", using: :btree

  create_table "attendance_types", force: :cascade do |t|
    t.string   "title"
    t.boolean  "boolean",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "brb_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.float    "default_value"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "brb_invoices", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "barcode"
    t.string   "barcode_with_format"
    t.string   "bank_agency"
    t.string   "bank_account"
    t.string   "cpf"
    t.string   "name"
    t.string   "address"
    t.integer  "state_id"
    t.string   "city"
    t.string   "cep"
    t.integer  "type_person",         default: 0
    t.integer  "modality",            default: 0
    t.integer  "type_document",       default: 0
    t.string   "code"
    t.date     "due"
    t.float    "value",               default: 0.0
    t.text     "message"
    t.date     "payment"
    t.integer  "status",              default: 0
    t.boolean  "remittance"
    t.text     "bank_return"
    t.string   "our_number"
    t.string   "document_number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "brb_invoices", ["category_id"], name: "index_brb_invoices_on_category_id", using: :btree
  add_index "brb_invoices", ["code"], name: "index_brb_invoices_on_code", unique: true, using: :btree
  add_index "brb_invoices", ["state_id"], name: "index_brb_invoices_on_state_id", using: :btree

  create_table "brb_remittances", force: :cascade do |t|
    t.text     "content"
    t.text     "header_content"
    t.integer  "invoices_id",                                 array: true
    t.boolean  "publish",        default: false
    t.date     "date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "candidate_activity_statuses", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status",     default: true
    t.integer  "code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "candidate_activity_statuses", ["code"], name: "index_candidate_activity_statuses_on_code", unique: true, using: :btree

  create_table "candidate_ammvs", force: :cascade do |t|
    t.string   "cpf"
    t.string   "name"
    t.string   "address"
    t.string   "unit"
    t.string   "singnature_date"
    t.string   "register_date"
    t.string   "constructor"
    t.string   "finance_agent"
    t.string   "cdru"
    t.string   "cdru_observation"
    t.integer  "unit_id"
    t.integer  "cadastre_id"
    t.integer  "index_migrate"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "candidate_ammvs", ["cadastre_id"], name: "index_candidate_ammvs_on_cadastre_id", using: :btree
  add_index "candidate_ammvs", ["unit_id"], name: "index_candidate_ammvs_on_unit_id", using: :btree

  create_table "candidate_attendance_log_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "candidate_attendance_logs", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "cadastre_id"
    t.integer  "user_id"
    t.integer  "attendance_status_id"
    t.string   "observation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "candidate_attendance_logs", ["cadastre_id"], name: "index_candidate_attendance_logs_on_cadastre_id", using: :btree
  add_index "candidate_attendance_logs", ["cadastre_mirror_id"], name: "index_candidate_attendance_logs_on_cadastre_mirror_id", using: :btree
  add_index "candidate_attendance_logs", ["user_id"], name: "index_candidate_attendance_logs_on_user_id", using: :btree

  create_table "candidate_attendance_statuses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "code"
  end

  create_table "candidate_attendances", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "convocation_id"
    t.integer  "attendance_status_id"
    t.integer  "staff_id"
    t.text     "observation"
    t.boolean  "status",               default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "checklist_id",                                     array: true
    t.string   "cpf"
    t.integer  "requeriment_id"
  end

  add_index "candidate_attendances", ["attendance_status_id"], name: "index_candidate_attendances_on_attendance_status_id", using: :btree
  add_index "candidate_attendances", ["cadastre_id"], name: "index_candidate_attendances_on_cadastre_id", using: :btree
  add_index "candidate_attendances", ["cadastre_mirror_id"], name: "index_candidate_attendances_on_cadastre_mirror_id", using: :btree
  add_index "candidate_attendances", ["checklist_id"], name: "index_candidate_attendances_on_checklist_id", using: :btree
  add_index "candidate_attendances", ["convocation_id"], name: "index_candidate_attendances_on_convocation_id", using: :btree
  add_index "candidate_attendances", ["requeriment_id"], name: "index_candidate_attendances_on_requeriment_id", using: :btree
  add_index "candidate_attendances", ["staff_id"], name: "index_candidate_attendances_on_staff_id", using: :btree

  create_table "candidate_cadastre_activities", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "staff_id"
    t.integer  "activity_status_id"
    t.integer  "type_activity",      default: 0
    t.boolean  "status",             default: true
    t.integer  "type_ocurrency",     default: 0
    t.text     "observation"
    t.text     "object_old"
    t.text     "object_new"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "cadastre_mirror_id"
  end

  add_index "candidate_cadastre_activities", ["activity_status_id"], name: "index_candidate_cadastre_activities_on_activity_status_id", using: :btree
  add_index "candidate_cadastre_activities", ["cadastre_id"], name: "index_candidate_cadastre_activities_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_activities", ["cadastre_mirror_id"], name: "index_candidate_cadastre_activities_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_activities", ["staff_id"], name: "index_candidate_cadastre_activities_on_staff_id", using: :btree

  create_table "candidate_cadastre_addresses", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "unit_id"
    t.string   "dominial_chain"
    t.integer  "type_occurrence"
    t.string   "observation"
    t.integer  "type_receipt"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "situation_id"
    t.integer  "staff_id"
    t.integer  "user_company_id"
    t.integer  "regularization_type_id"
  end

  add_index "candidate_cadastre_addresses", ["cadastre_id"], name: "index_candidate_cadatre_addresses_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_addresses", ["cadastre_mirror_id"], name: "index_candidate_cadatre_addresses_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_addresses", ["regularization_type_id"], name: "index_candidate_cadastre_addresses_on_regularization_type_id", using: :btree
  add_index "candidate_cadastre_addresses", ["situation_id"], name: "index_candidate_cadastre_addresses_on_situation_id", using: :btree
  add_index "candidate_cadastre_addresses", ["staff_id"], name: "index_candidate_cadastre_addresses_on_staff_id", using: :btree
  add_index "candidate_cadastre_addresses", ["unit_id"], name: "index_candidate_cadatre_addresses_on_unit_id", using: :btree
  add_index "candidate_cadastre_addresses", ["user_company_id"], name: "index_candidate_cadastre_addresses_on_user_company_id", using: :btree

  create_table "candidate_cadastre_attendance_statuses", force: :cascade do |t|
    t.integer  "cadastre_attendance_id"
    t.integer  "attendance_status_id"
    t.integer  "staff_id"
    t.integer  "mirror_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "candidate_cadastre_attendance_statuses", ["attendance_status_id"], name: "index_attendace_status_id", using: :btree
  add_index "candidate_cadastre_attendance_statuses", ["cadastre_attendance_id"], name: "index_cadastre_attendance_id", using: :btree
  add_index "candidate_cadastre_attendance_statuses", ["mirror_id"], name: "index_candidate_cadastre_attendance_statuses_on_mirror_id", using: :btree
  add_index "candidate_cadastre_attendance_statuses", ["staff_id"], name: "index_candidate_cadastre_attendance_statuses_on_staff_id", using: :btree

  create_table "candidate_cadastre_attendances", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "staff_id"
    t.integer  "situation",          default: 0
    t.integer  "attendance_type",    default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "candidate_cadastre_attendances", ["cadastre_id"], name: "index_candidate_cadastre_attendances_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_attendances", ["cadastre_mirror_id"], name: "index_candidate_cadastre_attendances_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_attendances", ["staff_id"], name: "index_candidate_cadastre_attendances_on_staff_id", using: :btree

  create_table "candidate_cadastre_checklists", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "checklist_id"
    t.boolean  "document_authenticate"
    t.string   "document_file"
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "candidate_cadastre_checklists", ["cadastre_mirror_id"], name: "index_candidate_cadastre_checklists_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_checklists", ["checklist_id"], name: "index_candidate_cadastre_checklists_on_checklist_id", using: :btree

  create_table "candidate_cadastre_events", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "cadastre_id"
    t.text     "cadastre_old"
    t.text     "cadastre_new"
    t.text     "observation_staff"
    t.text     "observation_system"
    t.integer  "situation",          default: 0
    t.boolean  "status",             default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "candidate_cadastre_events", ["cadastre_id"], name: "index_candidate_cadastre_events_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_events", ["staff_id"], name: "index_candidate_cadastre_events_on_staff_id", using: :btree

  create_table "candidate_cadastre_mirrors", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf",                     default: "", null: false
    t.integer  "gender"
    t.date     "born"
    t.string   "born_uf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf"
    t.string   "place_birth"
    t.date     "arrival_df"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "special_condition_id"
    t.string   "cep"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "address"
    t.string   "address_complement"
    t.float    "income"
    t.string   "work_cep"
    t.integer  "work_city_id"
    t.string   "work_address"
    t.string   "nis"
    t.string   "cid"
    t.integer  "civil_state_id"
    t.boolean  "special_condition_flag"
    t.integer  "program_id"
    t.boolean  "adapted_property"
    t.integer  "cadastre_id"
    t.integer  "cadastre_type",           default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "situation",               default: 0
    t.integer  "special_dependent_count"
  end

  add_index "candidate_cadastre_mirrors", ["cadastre_id"], name: "index_candidate_cadastre_mirrors_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["city_id"], name: "index_candidate_cadastre_mirrors_on_city_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["civil_state_id"], name: "index_candidate_cadastre_mirrors_on_civil_state_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["program_id"], name: "index_candidate_cadastre_mirrors_on_program_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["special_condition_id"], name: "index_candidate_cadastre_mirrors_on_special_condition_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["state_id"], name: "index_candidate_cadastre_mirrors_on_state_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["work_city_id"], name: "index_candidate_cadastre_mirrors_on_work_city_id", using: :btree

  create_table "candidate_cadastre_occurrences", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "occurrence_situation_id"
    t.integer  "occurrence_type_id"
    t.integer  "attendance_id"
    t.integer  "program_id"
    t.text     "description"
    t.boolean  "solved",                  default: false
    t.integer  "feedback_staff_id"
    t.text     "feedback_observation"
    t.string   "feedback_archive"
    t.datetime "feedback_datetime"
    t.boolean  "visible_portal",          default: true
    t.boolean  "default_label",           default: true
    t.string   "custom_label"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "candidate_cadastre_occurrences", ["attendance_id"], name: "index_candidate_cadastre_occurrences_on_attendance_id", using: :btree
  add_index "candidate_cadastre_occurrences", ["cadastre_id"], name: "index_candidate_cadastre_occurrences_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_occurrences", ["feedback_staff_id"], name: "index_candidate_cadastre_occurrences_on_feedback_staff_id", using: :btree
  add_index "candidate_cadastre_occurrences", ["occurrence_situation_id"], name: "index_candidate_cadastre_occurrences_on_occurrence_situation_id", using: :btree
  add_index "candidate_cadastre_occurrences", ["occurrence_type_id"], name: "index_candidate_cadastre_occurrences_on_occurrence_type_id", using: :btree
  add_index "candidate_cadastre_occurrences", ["program_id"], name: "index_candidate_cadastre_occurrences_on_program_id", using: :btree

  create_table "candidate_cadastre_procedurals", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "cadastre_id"
    t.integer  "procedural_status_id"
    t.integer  "convocation_id"
    t.integer  "assessment_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "old_process"
    t.integer  "staff_id"
    t.text     "observation"
    t.string   "transfer_process"
    t.integer  "transfer_assessment_id"
  end

  add_index "candidate_cadastre_procedurals", ["assessment_id"], name: "index_candidate_cadastre_procedurals_on_assessment_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["cadastre_mirror_id"], name: "index_candidate_cadastre_procedurals_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["convocation_id"], name: "index_candidate_cadastre_procedurals_on_convocation_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["procedural_status_id"], name: "index_candidate_cadastre_procedurals_on_procedural_status_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["staff_id"], name: "index_candidate_cadastre_procedurals_on_staff_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["transfer_assessment_id"], name: "index_candidate_cadastre_procedurals_on_transfer_assessment_id", using: :btree

  create_table "candidate_cadastre_situations", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "cadastre_id"
    t.integer  "situation_status_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "candidate_cadastre_situations", ["cadastre_id"], name: "index_candidate_cadastre_situations_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_situations", ["cadastre_mirror_id"], name: "index_candidate_cadastre_situations_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_situations", ["situation_status_id"], name: "index_candidate_cadastre_situations_on_situation_status_id", using: :btree

  create_table "candidate_cadastres", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf",                     default: "", null: false
    t.integer  "gender"
    t.date     "born"
    t.string   "born_uf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf"
    t.string   "place_birth"
    t.date     "arrival_df"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "special_condition_id"
    t.string   "cep"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "address"
    t.string   "address_complement"
    t.float    "income"
    t.string   "work_cep"
    t.integer  "work_city_id"
    t.string   "work_address"
    t.string   "nis"
    t.string   "cid"
    t.integer  "civil_state_id"
    t.boolean  "special_condition_flag"
    t.integer  "program_id"
    t.boolean  "adapted_property"
    t.integer  "old_cadastre_id"
    t.date     "date_old_cadastre"
    t.integer  "seqcad_id"
    t.datetime "last_signed_in"
    t.string   "password"
    t.string   "secret_ask"
    t.string   "secret_answer"
    t.string   "remember_token"
    t.string   "session_token"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "special_dependent_count"
  end

  add_index "candidate_cadastres", ["city_id"], name: "index_candidate_cadastres_on_city_id", using: :btree
  add_index "candidate_cadastres", ["civil_state_id"], name: "index_candidate_cadastres_on_civil_state_id", using: :btree
  add_index "candidate_cadastres", ["cpf"], name: "index_candidate_cadastres_on_cpf", unique: true, using: :btree
  add_index "candidate_cadastres", ["program_id"], name: "index_candidate_cadastres_on_program_id", using: :btree
  add_index "candidate_cadastres", ["remember_token"], name: "index_candidate_cadastres_on_remember_token", unique: true, using: :btree
  add_index "candidate_cadastres", ["special_condition_id"], name: "index_candidate_cadastres_on_special_condition_id", using: :btree
  add_index "candidate_cadastres", ["state_id"], name: "index_candidate_cadastres_on_state_id", using: :btree
  add_index "candidate_cadastres", ["work_city_id"], name: "index_candidate_cadastres_on_work_city_id", using: :btree

  create_table "candidate_cadins", force: :cascade do |t|
    t.string   "number_control"
    t.string   "name"
    t.date     "born"
    t.string   "process"
    t.integer  "occurrence_cadin_id"
    t.integer  "signed_instrument_id"
    t.string   "place_birth"
    t.string   "uf_born"
    t.string   "address"
    t.string   "cep"
    t.integer  "city_id"
    t.string   "cpf"
    t.string   "rg"
    t.date     "distribution_date"
    t.string   "percentage"
    t.text     "observation"
    t.boolean  "espolio"
    t.boolean  "freedup"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "candidate_cadins", ["city_id"], name: "index_candidate_cadins_on_city_id", using: :btree
  add_index "candidate_cadins", ["occurrence_cadin_id"], name: "index_candidate_cadins_on_occurrence_cadin_id", using: :btree
  add_index "candidate_cadins", ["signed_instrument_id"], name: "index_candidate_cadins_on_signed_instrument_id", using: :btree

  create_table "candidate_checklist_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "candidate_checklist_types", ["program_id"], name: "index_candidate_checklist_types_on_program_id", using: :btree

  create_table "candidate_checklists", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",            default: true
    t.string   "code"
    t.integer  "checklist_type_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "candidate_checklists", ["checklist_type_id"], name: "index_candidate_checklists_on_checklist_type_id", using: :btree

  create_table "candidate_civil_states", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_comunids", force: :cascade do |t|
    t.string   "code"
    t.string   "block"
    t.string   "group"
    t.string   "unit"
    t.string   "condominium"
    t.string   "sector"
    t.integer  "seal"
    t.string   "code_letter"
    t.string   "condition_interview"
    t.string   "outher_condition"
    t.string   "main_name"
    t.string   "main_rg"
    t.string   "main_cpf"
    t.string   "main_born"
    t.string   "main_uf_born"
    t.string   "main_telephone"
    t.string   "telephone_type"
    t.string   "main_nationality"
    t.integer  "total_family"
    t.string   "interviewed"
    t.string   "interviewed_rg"
    t.string   "interviewed_position"
    t.string   "residence_time"
    t.string   "residence_time_cond"
    t.string   "special_needs"
    t.string   "name_single_spouse"
    t.string   "residence_use"
    t.string   "construction_type"
    t.string   "number_floor"
    t.string   "rent_value"
    t.string   "water_supply"
    t.string   "water_box"
    t.string   "sewer"
    t.string   "bath_condition"
    t.string   "celeta_garbage"
    t.string   "eletrical_energy"
    t.string   "energy_standart"
    t.string   "energy_standart_situation"
    t.string   "flood"
    t.string   "mail_receive"
    t.string   "mail_box"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_convocations", force: :cascade do |t|
    t.string   "description"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "quantity",           default: 0
    t.text     "criteria"
    t.boolean  "status"
    t.string   "year_month"
    t.integer  "pontuation_code_id"
    t.integer  "pontuation_start",   default: 0
    t.integer  "pontuation_end",     default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "program_id"
    t.integer  "convocation_type"
  end

  add_index "candidate_convocations", ["pontuation_code_id"], name: "index_candidate_convocations_on_pontuation_code_id", using: :btree

  create_table "candidate_day_ocurrencies", force: :cascade do |t|
    t.integer  "update_income",            default: 0
    t.integer  "update_dependent",         default: 0
    t.integer  "update_special_condition", default: 0
    t.integer  "update_old",               default: 0
    t.integer  "halted",                   default: 0
    t.integer  "update_arrival_df",        default: 0
    t.integer  "enables_day",              default: 0
    t.integer  "change_zone",              default: 0
    t.integer  "update_data",              default: 0
    t.integer  "contemplated_day",         default: 0
    t.date     "date_ocurrency"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "candidate_dependent_mirrors", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "dependent_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf_id"
    t.date     "born"
    t.integer  "gender"
    t.string   "place_birth"
    t.integer  "civil_state_id"
    t.float    "income"
    t.integer  "kinship_id"
    t.boolean  "co_acquirer",            default: false
    t.float    "percentage"
    t.integer  "special_condition_id"
    t.boolean  "special_condition_flag", default: false
    t.string   "cid"
    t.string   "nis"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "candidate_dependent_mirrors", ["cadastre_id"], name: "index_candidate_dependent_mirrors_on_cadastre_id", using: :btree
  add_index "candidate_dependent_mirrors", ["cadastre_mirror_id"], name: "index_candidate_dependent_mirrors_on_cadastre_mirror_id", using: :btree
  add_index "candidate_dependent_mirrors", ["civil_state_id"], name: "index_candidate_dependent_mirrors_on_civil_state_id", using: :btree
  add_index "candidate_dependent_mirrors", ["dependent_id"], name: "index_candidate_dependent_mirrors_on_dependent_id", using: :btree
  add_index "candidate_dependent_mirrors", ["kinship_id"], name: "index_candidate_dependent_mirrors_on_kinship_id", using: :btree
  add_index "candidate_dependent_mirrors", ["special_condition_id"], name: "index_candidate_dependent_mirrors_on_special_condition_id", using: :btree

  create_table "candidate_dependents", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf_id"
    t.date     "born"
    t.integer  "gender"
    t.string   "place_birth"
    t.integer  "civil_state_id"
    t.float    "income"
    t.integer  "kinship_id"
    t.boolean  "co_acquirer",            default: false
    t.float    "percentage"
    t.integer  "special_condition_id"
    t.boolean  "special_condition_flag", default: false
    t.string   "cid"
    t.string   "nis"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "candidate_dependents", ["cadastre_id"], name: "index_candidate_dependents_on_cadastre_id", using: :btree
  add_index "candidate_dependents", ["civil_state_id"], name: "index_candidate_dependents_on_civil_state_id", using: :btree
  add_index "candidate_dependents", ["kinship_id"], name: "index_candidate_dependents_on_kinship_id", using: :btree
  add_index "candidate_dependents", ["special_condition_id"], name: "index_candidate_dependents_on_special_condition_id", using: :btree

  create_table "candidate_enterprise_cadastre_situations", force: :cascade do |t|
    t.integer  "enterprise_cadastre_id"
    t.integer  "enterprise_cadastre_status_id"
    t.text     "observation"
    t.string   "file_path"
    t.integer  "firm_user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "candidate_enterprise_cadastre_situations", ["enterprise_cadastre_id"], name: "index_enterprise_cadastre_on_enterprise_cadastre_id", using: :btree
  add_index "candidate_enterprise_cadastre_situations", ["enterprise_cadastre_status_id"], name: "index_ent_cad_on_enterprise_cad_status_id", using: :btree
  add_index "candidate_enterprise_cadastre_situations", ["firm_user_id"], name: "index_candidate_enterprise_cadastre_situations_on_firm_user_id", using: :btree

  create_table "candidate_enterprise_cadastres", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.integer  "cadastre_id"
    t.integer  "indication_cadastre_id"
    t.date     "inactive_date"
    t.boolean  "inactive"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "source_list"
    t.integer  "zone"
  end

  add_index "candidate_enterprise_cadastres", ["cadastre_id"], name: "index_candidate_enterprise_cadastres_on_cadastre_id", using: :btree
  add_index "candidate_enterprise_cadastres", ["enterprise_id"], name: "index_candidate_enterprise_cadastres_on_enterprise_id", using: :btree
  add_index "candidate_enterprise_cadastres", ["indication_cadastre_id"], name: "index_candidate_enterprise_cadastres_on_indication_cadastre_id", using: :btree

  create_table "candidate_enterprise_situation_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "candidate_inheritor_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "candidate_inheritors", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.integer  "inheritor_type_id"
    t.string   "cpf"
    t.string   "rg"
    t.date     "born"
    t.integer  "civil_state_id"
    t.string   "gender"
    t.string   "single_name"
    t.decimal  "percentage"
    t.text     "observation"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "candidate_inheritors", ["cadastre_id"], name: "index_candidate_inheritors_on_cadastre_id", using: :btree
  add_index "candidate_inheritors", ["civil_state_id"], name: "index_candidate_inheritors_on_civil_state_id", using: :btree
  add_index "candidate_inheritors", ["inheritor_type_id"], name: "index_candidate_inheritors_on_inheritor_type_id", using: :btree

  create_table "candidate_iptus", force: :cascade do |t|
    t.string   "cpf"
    t.string   "name"
    t.string   "registration"
    t.string   "address"
    t.string   "city"
    t.string   "kind_realty"
    t.string   "kind_search"
    t.string   "year"
    t.boolean  "realty_codhab"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "candidate_kinships", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_lists", force: :cascade do |t|
    t.string   "title"
    t.string   "condition_sql"
    t.integer  "list_type",     default: 0
    t.string   "view_target"
    t.boolean  "publish"
    t.boolean  "cpf_filter",    default: false
    t.boolean  "name_filter",   default: false
    t.boolean  "income_filter", default: false
    t.string   "slug"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "description"
    t.integer  "program_id"
  end

  add_index "candidate_lists", ["slug"], name: "index_candidate_lists_on_slug", unique: true, using: :btree

  create_table "candidate_occurrence_cadins", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_occurrence_situations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "color"
    t.boolean  "status",         default: true
    t.boolean  "visible_portal", default: true
    t.string   "label_portal"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "candidate_occurrence_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_pontuations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "code"
    t.float    "bsb"
    t.float    "dependent"
    t.float    "timelist"
    t.float    "special_condition"
    t.float    "income"
    t.float    "total"
    t.integer  "program_id"
    t.integer  "situation_status_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "position"
  end

  add_index "candidate_pontuations", ["cadastre_id"], name: "index_candidate_pontuations_on_cadastre_id", using: :btree
  add_index "candidate_pontuations", ["cadastre_mirror_id"], name: "index_candidate_pontuations_on_cadastre_mirror_id", using: :btree
  add_index "candidate_pontuations", ["program_id"], name: "index_candidate_pontuations_on_program_id", using: :btree
  add_index "candidate_pontuations", ["situation_status_id"], name: "index_candidate_pontuations_on_situation_status_id", using: :btree

  create_table "candidate_positions", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "pontuation_id"
    t.integer  "position"
    t.integer  "program_id"
    t.integer  "zone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "candidate_positions", ["cadastre_id"], name: "index_candidate_positions_on_cadastre_id", using: :btree
  add_index "candidate_positions", ["pontuation_id"], name: "index_candidate_positions_on_pontuation_id", using: :btree
  add_index "candidate_positions", ["program_id"], name: "index_candidate_positions_on_program_id", using: :btree

  create_table "candidate_procedural_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "candidate_procedural_statuses", ["code"], name: "index_candidate_procedural_statuses_on_code", unique: true, using: :btree

  create_table "candidate_programs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "candidate_regularization_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_signed_instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_situation_cadastre_addresses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "status",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "candidate_situation_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
  end

  add_index "candidate_situation_statuses", ["code"], name: "index_candidate_situation_statuses_on_code", unique: true, using: :btree

  create_table "candidate_special_conditions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_verifications", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "text_valid"
    t.string   "text_invalid"
    t.integer  "verification_type"
    t.string   "sql"
    t.string   "service"
    t.integer  "program_id"
    t.string   "code"
    t.boolean  "publish",           default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "candidate_verifications", ["program_id"], name: "index_candidate_verifications_on_program_id", using: :btree

  create_table "candidate_vois", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cpf"
    t.string   "rg"
    t.integer  "situation",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "candidate_zones", force: :cascade do |t|
    t.string   "name"
    t.float    "start_value", default: 0.0
    t.float    "end_value",   default: 0.0
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "candidate_zones", ["code"], name: "index_candidate_zones_on_code", unique: true, using: :btree

  create_table "cms_galleries", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "status"
    t.string   "thumbnail"
    t.string   "photo",      default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "date"
    t.boolean  "private"
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
    t.string   "slug"
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
    t.string   "flickr"
    t.string   "color"
  end

  add_index "cms_posts", ["post_category_id"], name: "index_cms_posts_on_post_category_id", using: :btree

  create_table "cms_service_results", force: :cascade do |t|
    t.integer  "program_morarbem"
    t.integer  "regularization"
    t.integer  "contract"
    t.integer  "ombudsman"
    t.integer  "protocol"
    t.date     "date"
    t.boolean  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "cms_videos", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.boolean  "publish"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "concourse_candidate_messages", force: :cascade do |t|
    t.integer  "candidate_id"
    t.text     "message"
    t.integer  "message_type"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_candidate_messages", ["candidate_id"], name: "index_concourse_candidate_messages_on_candidate_id", using: :btree

  create_table "concourse_candidate_participations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.text     "team_description"
    t.string   "archive_one"
    t.string   "archive_two"
    t.string   "archive_three"
    t.string   "archive_four"
    t.string   "archive_five"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "concourse_candidate_participations", ["candidate_id"], name: "index_concourse_candidate_participations_on_candidate_id", using: :btree

  create_table "concourse_candidate_tokens", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "secret_key"
    t.boolean  "status",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "concourse_candidate_tokens", ["candidate_id"], name: "index_concourse_candidate_tokens_on_candidate_id", using: :btree
  add_index "concourse_candidate_tokens", ["secret_key"], name: "index_concourse_candidate_tokens_on_secret_key", unique: true, using: :btree

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
    t.text     "properties"
    t.string   "protocol"
    t.text     "observation"
    t.integer  "status",            default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "professional_type"
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
    t.boolean  "responded"
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
    t.integer  "order",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "concourse_navs", ["page_id"], name: "index_concourse_navs_on_page_id", using: :btree
  add_index "concourse_navs", ["project_id"], name: "index_concourse_navs_on_project_id", using: :btree

  create_table "concourse_observations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.text     "content"
    t.integer  "message_type"
    t.integer  "staff_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "concourse_observations", ["candidate_id"], name: "index_concourse_observations_on_candidate_id", using: :btree
  add_index "concourse_observations", ["staff_id"], name: "index_concourse_observations_on_staff_id", using: :btree

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

  create_table "concourse_projects", force: :cascade do |t|
    t.string   "title"
    t.text     "mini_description"
    t.text     "apresentation"
    t.date     "start"
    t.date     "end"
    t.boolean  "publish",                  default: false
    t.boolean  "status",                   default: false
    t.string   "image_header"
    t.string   "image_logo"
    t.string   "image_footer"
    t.string   "image_slider"
    t.boolean  "slider",                   default: false
    t.boolean  "consultation",             default: false
    t.date     "consultation_start"
    t.date     "consultation_end"
    t.text     "consultation_description"
    t.string   "slug"
    t.integer  "step",                     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "slider_html"
    t.date     "start_participation"
    t.date     "end_participation"
    t.text     "text_participation"
    t.string   "result_document"
    t.text     "result_description"
    t.string   "result_date"
    t.boolean  "popup_publish"
    t.string   "popup_title"
    t.text     "popup_content"
    t.date     "result_day"
    t.time     "result_hour"
  end

  create_table "concourse_subscribes", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.boolean  "fee"
    t.integer  "type_guide_id"
    t.date     "start"
    t.date     "end"
    t.boolean  "publish"
    t.text     "observation"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date_payment"
  end

  add_index "concourse_subscribes", ["project_id"], name: "index_concourse_subscribes_on_project_id", using: :btree
  add_index "concourse_subscribes", ["type_guide_id"], name: "index_concourse_subscribes_on_type_guide_id", using: :btree

  create_table "concourse_winners", force: :cascade do |t|
    t.integer  "participation_id"
    t.integer  "candidate_id"
    t.integer  "position"
    t.integer  "project_id"
    t.integer  "subscribe_id"
    t.integer  "winner_type",      default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "concourse_winners", ["candidate_id"], name: "index_concourse_winners_on_candidate_id", using: :btree
  add_index "concourse_winners", ["participation_id"], name: "index_concourse_winners_on_participation_id", using: :btree
  add_index "concourse_winners", ["project_id"], name: "index_concourse_winners_on_project_id", using: :btree
  add_index "concourse_winners", ["subscribe_id"], name: "index_concourse_winners_on_subscribe_id", using: :btree

  create_table "dashboard_warnings", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.text     "resume"
    t.boolean  "publish"
    t.date     "date"
    t.boolean  "status"
    t.integer  "category"
    t.integer  "color"
    t.string   "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_activities", force: :cascade do |t|
    t.string   "description"
    t.date     "start"
    t.date     "end"
    t.string   "observation"
    t.integer  "situation"
    t.integer  "cadastre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "entity_activities", ["cadastre_id"], name: "index_entity_activities_on_cadastre_id", using: :btree

  create_table "entity_cadastres", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.string   "fantasy_name"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "email"
    t.string   "celphone"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "cep"
    t.integer  "city_id"
    t.text     "observation"
    t.boolean  "status",             default: true
    t.string   "password"
    t.string   "reset_token"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "entity_cadastres", ["city_id"], name: "index_entity_cadastres_on_city_id", using: :btree
  add_index "entity_cadastres", ["cnpj"], name: "index_entity_cadastres_on_cnpj", unique: true, using: :btree

  create_table "entity_candidates", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "cadastre_id"
    t.boolean  "status"
    t.date     "date_in"
    t.date     "date_out"
    t.text     "observation"
    t.string   "document"
    t.boolean  "accepted"
    t.datetime "date_accepted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "entity_candidates", ["cadastre_id"], name: "index_entity_candidates_on_cadastre_id", using: :btree
  add_index "entity_candidates", ["candidate_id"], name: "index_entity_candidates_on_candidate_id", using: :btree

  create_table "entity_document_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.boolean  "required",      default: false
    t.integer  "document_type", default: 0
    t.boolean  "status",        default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "entity_document_categories", ["code"], name: "index_entity_document_categories_on_code", unique: true, using: :btree

  create_table "entity_documents", force: :cascade do |t|
    t.string   "archive_path"
    t.integer  "document_category_id"
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.text     "observation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "entity_documents", ["cadastre_id"], name: "index_entity_documents_on_cadastre_id", using: :btree
  add_index "entity_documents", ["cadastre_mirror_id"], name: "index_entity_documents_on_cadastre_mirror_id", using: :btree
  add_index "entity_documents", ["document_category_id"], name: "index_entity_documents_on_document_category_id", using: :btree

  create_table "entity_inspections", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "address_optional"
    t.string   "general_photo_1"
    t.string   "general_photo_2"
    t.string   "general_photo_3"
    t.string   "size"
    t.integer  "property_type"
    t.string   "property_owner"
    t.text     "others_local"
    t.string   "operating_time"
    t.string   "location_time"
    t.string   "meeting_frequency"
    t.string   "elected"
    t.string   "action_area"
    t.string   "associated_amount"
    t.string   "business_hour"
    t.string   "business_days"
    t.integer  "inspection_type"
    t.string   "attorney"
    t.string   "documentation_photo_1"
    t.string   "documentation_photo_2"
    t.string   "responsible_name"
    t.string   "responsible_cpf"
    t.string   "responsible_rg"
    t.string   "responsible_title"
    t.string   "responsible_photo"
    t.string   "responsible_phone"
    t.integer  "occupied_property"
    t.text     "additional_information"
    t.string   "attorney_name"
    t.text     "property_description"
    t.date     "current_elected"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "entity_inspections", ["cadastre_id"], name: "index_entity_inspections_on_cadastre_id", using: :btree

  create_table "entity_member_additionals", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "social_reason"
    t.integer  "member_job_id"
    t.date     "start"
    t.date     "end"
    t.integer  "member_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "entity_member_additionals", ["member_id"], name: "index_entity_member_additionals_on_member_id", using: :btree
  add_index "entity_member_additionals", ["member_job_id"], name: "index_entity_member_additionals_on_member_job_id", using: :btree

  create_table "entity_member_jobs", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "entity_member_jobs", ["code"], name: "index_entity_member_jobs_on_code", unique: true, using: :btree

  create_table "entity_members", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "address"
    t.integer  "city_id"
    t.string   "cep"
    t.string   "email"
    t.date     "start"
    t.date     "end"
    t.date     "born"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "certificate_civil_criminal"
    t.string   "photo"
    t.boolean  "status",                     default: true
    t.integer  "member_job_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "entity_members", ["cadastre_id"], name: "index_entity_members_on_cadastre_id", using: :btree
  add_index "entity_members", ["city_id"], name: "index_entity_members_on_city_id", using: :btree
  add_index "entity_members", ["cpf", "cadastre_id"], name: "index_entity_members_on_cpf_and_cadastre_id", unique: true, using: :btree
  add_index "entity_members", ["member_job_id"], name: "index_entity_members_on_member_job_id", using: :btree

  create_table "entity_messages", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "entity_messages", ["cadastre_id"], name: "index_entity_messages_on_cadastre_id", using: :btree

  create_table "entity_old_candidates", force: :cascade do |t|
    t.integer  "old_id"
    t.integer  "cadastre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "entity_old_candidates", ["cadastre_id"], name: "index_entity_old_candidates_on_cadastre_id", using: :btree
  add_index "entity_old_candidates", ["old_id"], name: "index_entity_old_candidates_on_old_id", using: :btree

  create_table "entity_olds", force: :cascade do |t|
    t.string   "name"
    t.string   "fantasy_name"
    t.string   "cnpj"
    t.string   "president_name"
    t.string   "president_cpf"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "old"
    t.string   "address"
    t.string   "cep"
    t.boolean  "pf_problem"
    t.string   "city"
    t.string   "lat"
    t.string   "long"
  end

  create_table "entity_realties", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.string   "address"
    t.integer  "city_id"
    t.string   "complement"
    t.string   "number"
    t.string   "burgh"
    t.string   "observation"
    t.integer  "situation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "entity_realties", ["cadastre_id"], name: "index_entity_realties_on_cadastre_id", using: :btree
  add_index "entity_realties", ["cadastre_mirror_id"], name: "index_entity_realties_on_cadastre_mirror_id", using: :btree
  add_index "entity_realties", ["city_id"], name: "index_entity_realties_on_city_id", using: :btree

  create_table "entity_situation_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "entity_situation_statuses", ["code"], name: "index_entity_situation_statuses_on_code", unique: true, using: :btree

  create_table "entity_situations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "situation_status_id"
    t.integer  "staff_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "entity_situations", ["cadastre_id"], name: "index_entity_situations_on_cadastre_id", using: :btree
  add_index "entity_situations", ["cadastre_mirror_id"], name: "index_entity_situations_on_cadastre_mirror_id", using: :btree
  add_index "entity_situations", ["situation_status_id"], name: "index_entity_situations_on_situation_status_id", using: :btree
  add_index "entity_situations", ["staff_id"], name: "index_entity_situations_on_staff_id", using: :btree

  create_table "firm_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "trade"
    t.string   "cnpj"
    t.string   "email"
    t.integer  "city_id"
    t.string   "address"
    t.string   "adjuntc_address"
    t.string   "cep"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.boolean  "status",             default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "firm_companies", ["city_id"], name: "index_firm_companies_on_city_id", using: :btree

  create_table "firm_enterprise_cadastres", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.integer  "cadastre_id"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "source_list"
  end

  add_index "firm_enterprise_cadastres", ["cadastre_id"], name: "index_firm_enterprise_cadastres_on_cadastre_id", using: :btree
  add_index "firm_enterprise_cadastres", ["enterprise_id"], name: "index_firm_enterprise_cadastres_on_enterprise_id", using: :btree

  create_table "firm_enterprise_statuses", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "enterprise_cadastre_id"
    t.integer  "status_cadastre_id"
    t.text     "observation"
    t.string   "archive_file"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_company_id"
    t.integer  "enterprise_id"
  end

  add_index "firm_enterprise_statuses", ["cadastre_id"], name: "index_firm_enterprise_statuses_on_cadastre_id", using: :btree
  add_index "firm_enterprise_statuses", ["enterprise_cadastre_id"], name: "index_firm_enterprise_statuses_on_enterprise_cadastre_id", using: :btree
  add_index "firm_enterprise_statuses", ["enterprise_id"], name: "index_firm_enterprise_statuses_on_enterprise_id", using: :btree
  add_index "firm_enterprise_statuses", ["status_cadastre_id"], name: "index_firm_enterprise_statuses_on_status_cadastre_id", using: :btree
  add_index "firm_enterprise_statuses", ["user_company_id"], name: "index_firm_enterprise_statuses_on_user_company_id", using: :btree

  create_table "firm_enterprises", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.integer  "tipology_id"
    t.integer  "company_id"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "firm_enterprises", ["company_id"], name: "index_firm_enterprises_on_company_id", using: :btree
  add_index "firm_enterprises", ["tipology_id"], name: "index_firm_enterprises_on_tipology_id", using: :btree

  create_table "firm_status_cadastres", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",      default: true
    t.string   "type_status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "firm_tipologies", force: :cascade do |t|
    t.string   "name"
    t.string   "home_type"
    t.string   "private_area"
    t.string   "income_family"
    t.float    "initial_value"
    t.float    "end_value"
    t.boolean  "status",        default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "firm_user_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login_user"
    t.string   "password"
    t.boolean  "admin"
    t.integer  "company_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "firm_user_companies", ["company_id"], name: "index_firm_user_companies_on_company_id", using: :btree

  create_table "helpdesk_ticket_attendants", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.integer  "staff_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "helpdesk_ticket_attendants", ["staff_id"], name: "index_helpdesk_ticket_attendants_on_staff_id", using: :btree
  add_index "helpdesk_ticket_attendants", ["ticket_type_id"], name: "index_helpdesk_ticket_attendants_on_ticket_type_id", using: :btree

  create_table "helpdesk_ticket_ocurrences", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "staff_id"
    t.integer  "responsible_id"
    t.text     "ocurrence"
    t.integer  "ticket_solution_id"
    t.datetime "solution_date"
    t.datetime "scheduled_date"
    t.boolean  "scheduled"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "helpdesk_ticket_ocurrences", ["responsible_id"], name: "index_helpdesk_ticket_ocurrences_on_responsible_id", using: :btree
  add_index "helpdesk_ticket_ocurrences", ["staff_id"], name: "index_helpdesk_ticket_ocurrences_on_staff_id", using: :btree
  add_index "helpdesk_ticket_ocurrences", ["ticket_id"], name: "index_helpdesk_ticket_ocurrences_on_ticket_id", using: :btree
  add_index "helpdesk_ticket_ocurrences", ["ticket_solution_id"], name: "index_helpdesk_ticket_ocurrences_on_ticket_solution_id", using: :btree

  create_table "helpdesk_ticket_solutions", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.string   "solution_sla"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "helpdesk_ticket_solutions", ["ticket_type_id"], name: "index_helpdesk_ticket_solutions_on_ticket_type_id", using: :btree

  create_table "helpdesk_ticket_subjects", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.string   "subject_sla"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "helpdesk_ticket_subjects", ["ticket_type_id"], name: "index_helpdesk_ticket_subjects_on_ticket_type_id", using: :btree

  create_table "helpdesk_ticket_types", force: :cascade do |t|
    t.integer  "sector_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "helpdesk_ticket_types", ["sector_id"], name: "index_helpdesk_ticket_types_on_sector_id", using: :btree

  create_table "helpdesk_tickets", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.integer  "requester_id"
    t.integer  "attendant_id"
    t.integer  "ticket_subject_id"
    t.integer  "sector_id"
    t.datetime "attendance_start"
    t.datetime "attendance_end"
    t.datetime "deadline"
    t.integer  "status",            default: 0
    t.text     "description"
    t.text     "meta_tags"
    t.string   "code_computer"
    t.string   "file_path"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "helpdesk_tickets", ["attendant_id"], name: "index_helpdesk_tickets_on_attendant_id", using: :btree
  add_index "helpdesk_tickets", ["requester_id"], name: "index_helpdesk_tickets_on_requester_id", using: :btree
  add_index "helpdesk_tickets", ["sector_id"], name: "index_helpdesk_tickets_on_sector_id", using: :btree
  add_index "helpdesk_tickets", ["ticket_subject_id"], name: "index_helpdesk_tickets_on_ticket_subject_id", using: :btree
  add_index "helpdesk_tickets", ["ticket_type_id"], name: "index_helpdesk_tickets_on_ticket_type_id", using: :btree

  create_table "indication_allotments", force: :cascade do |t|
    t.integer  "step_id"
    t.integer  "zone_id"
    t.integer  "demand"
    t.integer  "rii"
    t.integer  "rie"
    t.integer  "old"
    t.integer  "special"
    t.integer  "vulnerable"
    t.integer  "situation",     default: 0
    t.integer  "staff_id"
    t.integer  "supervisor_id"
    t.text     "observation"
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "indication_allotments", ["staff_id"], name: "index_indication_allotments_on_staff_id", using: :btree
  add_index "indication_allotments", ["step_id"], name: "index_indication_allotments_on_step_id", using: :btree
  add_index "indication_allotments", ["supervisor_id"], name: "index_indication_allotments_on_supervisor_id", using: :btree
  add_index "indication_allotments", ["zone_id"], name: "index_indication_allotments_on_zone_id", using: :btree

  create_table "indication_cadastres", force: :cascade do |t|
    t.integer  "allotment_id"
    t.integer  "cadastre_id"
    t.integer  "program_id"
    t.integer  "pontuation_id"
    t.integer  "situation",     default: 0
    t.string   "observation"
    t.string   "zone"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "source_list"
  end

  add_index "indication_cadastres", ["allotment_id"], name: "index_indication_cadastres_on_allotment_id", using: :btree
  add_index "indication_cadastres", ["cadastre_id"], name: "index_indication_cadastres_on_cadastre_id", using: :btree
  add_index "indication_cadastres", ["pontuation_id"], name: "index_indication_cadastres_on_pontuation_id", using: :btree
  add_index "indication_cadastres", ["program_id"], name: "index_indication_cadastres_on_program_id", using: :btree

  create_table "juridical_advice_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_complements", force: :cascade do |t|
    t.integer  "document_type_id"
    t.integer  "lawsuit_id"
    t.integer  "instancy_place_id"
    t.date     "distribution_date"
    t.date     "deadline"
    t.integer  "days"
    t.date     "end_date"
    t.text     "complement"
    t.integer  "responsible_lawyer_id"
    t.integer  "advice_type_id"
    t.string   "file_path"
    t.boolean  "status"
    t.integer  "complement_father_id"
    t.integer  "legal_advice_id"
    t.integer  "staff_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "juridical_complements", ["advice_type_id"], name: "index_juridical_complements_on_advice_type_id", using: :btree
  add_index "juridical_complements", ["complement_father_id"], name: "index_juridical_complements_on_complement_father_id", using: :btree
  add_index "juridical_complements", ["document_type_id"], name: "index_juridical_complements_on_document_type_id", using: :btree
  add_index "juridical_complements", ["instancy_place_id"], name: "index_juridical_complements_on_instancy_place_id", using: :btree
  add_index "juridical_complements", ["lawsuit_id"], name: "index_juridical_complements_on_lawsuit_id", using: :btree
  add_index "juridical_complements", ["legal_advice_id"], name: "index_juridical_complements_on_legal_advice_id", using: :btree
  add_index "juridical_complements", ["responsible_lawyer_id"], name: "index_juridical_complements_on_responsible_lawyer_id", using: :btree
  add_index "juridical_complements", ["staff_id"], name: "index_juridical_complements_on_staff_id", using: :btree

  create_table "juridical_housing_programs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_instancies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_instancy_places", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "instancy_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "juridical_instancy_places", ["instancy_id"], name: "index_juridical_instancy_places_on_instancy_id", using: :btree

  create_table "juridical_lawsuits", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_legal_advices", force: :cascade do |t|
    t.string   "process_number"
    t.string   "agency"
    t.integer  "lawsuit_id"
    t.decimal  "lawsuit_value"
    t.integer  "instancy_place_id"
    t.integer  "housing_program_id"
    t.integer  "document_type_id"
    t.integer  "responsible_lawyer_id"
    t.text     "description_complement"
    t.boolean  "status"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "process_type"
    t.string   "suitor"
    t.integer  "staff_id"
    t.integer  "old_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "juridical_legal_advices", ["document_type_id"], name: "index_juridical_legal_advices_on_document_type_id", using: :btree
  add_index "juridical_legal_advices", ["housing_program_id"], name: "index_juridical_legal_advices_on_housing_program_id", using: :btree
  add_index "juridical_legal_advices", ["instancy_place_id"], name: "index_juridical_legal_advices_on_instancy_place_id", using: :btree
  add_index "juridical_legal_advices", ["lawsuit_id"], name: "index_juridical_legal_advices_on_lawsuit_id", using: :btree
  add_index "juridical_legal_advices", ["old_id"], name: "index_juridical_legal_advices_on_old_id", using: :btree
  add_index "juridical_legal_advices", ["responsible_lawyer_id"], name: "index_juridical_legal_advices_on_responsible_lawyer_id", using: :btree
  add_index "juridical_legal_advices", ["staff_id"], name: "index_juridical_legal_advices_on_staff_id", using: :btree

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
    t.string   "code"
  end

  add_index "person_sectors", ["father_id"], name: "index_person_sectors_on_father_id", using: :btree
  add_index "person_sectors", ["responsible_id"], name: "index_person_sectors_on_responsible_id", using: :btree

  create_table "person_staff_permissions", force: :cascade do |t|
    t.integer  "system_id"
    t.integer  "system_permission_id"
    t.integer  "system_module_id"
    t.integer  "staff_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "person_staff_permissions", ["staff_id"], name: "index_person_staff_permissions_on_staff_id", using: :btree
  add_index "person_staff_permissions", ["system_id"], name: "index_person_staff_permissions_on_system_id", using: :btree
  add_index "person_staff_permissions", ["system_module_id"], name: "index_person_staff_permissions_on_system_module_id", using: :btree
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
    t.string   "personal_image"
    t.string   "curriculum"
    t.string   "email",               default: "",   null: false
    t.time     "start_hour"
    t.time     "end_hour"
    t.date     "date_contract"
    t.date     "date_shutdown"
    t.boolean  "wekeend"
    t.boolean  "status",              default: true
    t.boolean  "administrator",       default: true
    t.integer  "gender",              default: 0
    t.integer  "branch_line_id"
    t.integer  "job_id"
    t.integer  "sector_origin_id"
    t.integer  "sector_current_id"
    t.integer  "user_responsible_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.date     "password_change"
    t.integer  "privilege_id",                                    array: true
    t.string   "password"
    t.string   "token"
    t.boolean  "token_status",        default: true
    t.date     "last_signed_in_at"
    t.string   "branch_line"
  end

  add_index "person_staffs", ["branch_line_id"], name: "index_person_staffs_on_branch_line_id", using: :btree
  add_index "person_staffs", ["code"], name: "index_person_staffs_on_code", unique: true, using: :btree
  add_index "person_staffs", ["job_id"], name: "index_person_staffs_on_job_id", using: :btree
  add_index "person_staffs", ["sector_current_id"], name: "index_person_staffs_on_sector_current_id", using: :btree
  add_index "person_staffs", ["sector_origin_id"], name: "index_person_staffs_on_sector_origin_id", using: :btree
  add_index "person_staffs", ["user_responsible_id"], name: "index_person_staffs_on_user_responsible_id", using: :btree

  create_table "person_system_modules", force: :cascade do |t|
    t.string   "title"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "system_module_id"
  end

  add_index "person_systems", ["system_module_id"], name: "index_person_systems_on_system_module_id", using: :btree

  create_table "planning_discussion_messages", force: :cascade do |t|
    t.integer  "author_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "planning_discussion_messages", ["author_id"], name: "index_planning_discussion_messages_on_author_id", using: :btree

  create_table "planning_discussions", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "planning_discussions", ["author_id"], name: "index_planning_discussions_on_author_id", using: :btree
  add_index "planning_discussions", ["project_id"], name: "index_planning_discussions_on_project_id", using: :btree

  create_table "planning_problems", force: :cascade do |t|
    t.string   "subject"
    t.text     "description"
    t.integer  "problem_type"
    t.integer  "risk_type"
    t.date     "identification"
    t.date     "due"
    t.integer  "responsible_id"
    t.integer  "situation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "planning_problems", ["responsible_id"], name: "index_planning_problems_on_responsible_id", using: :btree

  create_table "planning_project_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "planning_projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "level"
    t.integer  "sector_id"
    t.integer  "project_category_id"
    t.boolean  "priority_visible"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "planning_projects", ["project_category_id"], name: "index_planning_projects_on_project_category_id", using: :btree
  add_index "planning_projects", ["sector_id"], name: "index_planning_projects_on_sector_id", using: :btree

  create_table "planning_tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "priority"
    t.integer  "project_id"
    t.date     "due"
    t.integer  "responsible_id"
    t.integer  "order"
    t.integer  "author_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "planning_tasks", ["author_id"], name: "index_planning_tasks_on_author_id", using: :btree
  add_index "planning_tasks", ["project_id"], name: "index_planning_tasks_on_project_id", using: :btree
  add_index "planning_tasks", ["responsible_id"], name: "index_planning_tasks_on_responsible_id", using: :btree

  create_table "project_enterprises", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "typology_id"
    t.integer  "company_id"
    t.boolean  "status",         default: true
    t.string   "edict_number"
    t.string   "process_number"
    t.integer  "situation"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "units"
  end

  add_index "project_enterprises", ["company_id"], name: "index_project_enterprises_on_company_id", using: :btree
  add_index "project_enterprises", ["typology_id"], name: "index_project_enterprises_on_typology_id", using: :btree

  create_table "project_steps", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.string   "name"
    t.text     "text"
    t.integer  "demand",        default: 0
    t.string   "rii",           default: "40"
    t.string   "rie",           default: "40"
    t.string   "old",           default: "8"
    t.string   "special",       default: "7"
    t.string   "vulnerable",    default: "5"
    t.integer  "situation",     default: 0
    t.boolean  "status",        default: true
    t.integer  "creator_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "project_steps", ["creator_id"], name: "index_project_steps_on_creator_id", using: :btree
  add_index "project_steps", ["enterprise_id"], name: "index_project_steps_on_enterprise_id", using: :btree

  create_table "project_typologies", force: :cascade do |t|
    t.string   "name"
    t.string   "home_type"
    t.string   "private_area"
    t.string   "income_family"
    t.string   "initial_value"
    t.string   "end_value"
    t.boolean  "status",        default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
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
    t.integer  "id_old"
    t.string   "city"
    t.boolean  "finalized"
    t.datetime "finalized_date"
    t.boolean  "responded"
    t.datetime "responded_date"
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

  create_table "protocol_call_controls", force: :cascade do |t|
    t.time     "time_start"
    t.time     "time_end"
    t.string   "phone_number"
    t.string   "interested"
    t.text     "observation"
    t.integer  "staff_id"
    t.integer  "assessment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "protocol_call_controls", ["assessment_id"], name: "index_protocol_call_controls_on_assessment_id", using: :btree
  add_index "protocol_call_controls", ["staff_id"], name: "index_protocol_call_controls_on_staff_id", using: :btree

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

  create_table "protocol_control_interesteds", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "foundation"
    t.string   "address"
    t.integer  "state_id"
    t.integer  "city_id"
    t.string   "cep"
    t.string   "email"
    t.string   "telephone"
    t.string   "fax"
    t.integer  "interested_type"
    t.integer  "staff_id"
    t.integer  "control_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "protocol_control_interesteds", ["city_id"], name: "index_protocol_control_interesteds_on_city_id", using: :btree
  add_index "protocol_control_interesteds", ["control_id"], name: "index_protocol_control_interesteds_on_control_id", using: :btree
  add_index "protocol_control_interesteds", ["staff_id"], name: "index_protocol_control_interesteds_on_staff_id", using: :btree
  add_index "protocol_control_interesteds", ["state_id"], name: "index_protocol_control_interesteds_on_state_id", using: :btree

  create_table "protocol_control_routes", force: :cascade do |t|
    t.boolean  "responded"
    t.boolean  "bureau_route"
    t.boolean  "conduct"
    t.boolean  "link"
    t.boolean  "redistribuited"
    t.boolean  "need_answer"
    t.boolean  "finalized"
    t.integer  "route_sector_id"
    t.integer  "route_staff_id"
    t.date     "route_sector_date"
    t.string   "redistribuited_to"
    t.integer  "control_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "protocol_control_routes", ["control_id"], name: "index_protocol_control_routes_on_control_id", using: :btree
  add_index "protocol_control_routes", ["route_sector_id"], name: "index_protocol_control_routes_on_route_sector_id", using: :btree
  add_index "protocol_control_routes", ["route_staff_id"], name: "index_protocol_control_routes_on_route_staff_id", using: :btree

  create_table "protocol_controls", force: :cascade do |t|
    t.integer  "assessment_id"
    t.integer  "staff_id"
    t.date     "input_doc_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "protocol_controls", ["assessment_id"], name: "index_protocol_controls_on_assessment_id", using: :btree
  add_index "protocol_controls", ["staff_id"], name: "index_protocol_controls_on_staff_id", using: :btree

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
    t.string   "desk"
    t.string   "network_path"
  end

  add_index "protocol_locations", ["assessment_id"], name: "index_protocol_locations_on_assessment_id", using: :btree
  add_index "protocol_locations", ["sector_id"], name: "index_protocol_locations_on_sector_id", using: :btree
  add_index "protocol_locations", ["staff_id"], name: "index_protocol_locations_on_staff_id", using: :btree

  create_table "protocol_solicitation_providences", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "protocol_solicitation_replies", force: :cascade do |t|
    t.integer  "providence_id"
    t.date     "providence_date"
    t.integer  "providence_staff_id"
    t.boolean  "process_delivered"
    t.date     "delivered_date"
    t.integer  "responsible_delivered_id"
    t.text     "observation"
    t.integer  "solicitation_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "protocol_solicitation_replies", ["providence_id"], name: "index_protocol_solicitation_replies_on_providence_id", using: :btree
  add_index "protocol_solicitation_replies", ["providence_staff_id"], name: "index_protocol_solicitation_replies_on_providence_staff_id", using: :btree
  add_index "protocol_solicitation_replies", ["responsible_delivered_id"], name: "index_protocol_solicitation_replies_on_responsible_delivered_id", using: :btree
  add_index "protocol_solicitation_replies", ["solicitation_id"], name: "index_protocol_solicitation_replies_on_solicitation_id", using: :btree

  create_table "protocol_solicitations", force: :cascade do |t|
    t.integer  "assessment_id"
    t.date     "order_date"
    t.integer  "staff_id"
    t.text     "observation"
    t.integer  "priority"
    t.integer  "authenticate_id"
    t.date     "authenticate_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "protocol_solicitations", ["assessment_id"], name: "index_protocol_solicitations_on_assessment_id", using: :btree
  add_index "protocol_solicitations", ["authenticate_id"], name: "index_protocol_solicitations_on_authenticate_id", using: :btree
  add_index "protocol_solicitations", ["staff_id"], name: "index_protocol_solicitations_on_staff_id", using: :btree

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
    t.integer  "user_id"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree
  add_index "redactor_assets", ["user_id"], name: "index_redactor_assets_on_user_id", using: :btree

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
    t.boolean  "status",           default: false
    t.integer  "convocation_id"
    t.integer  "unit_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "regularization_requeriments", ["convocation_id"], name: "index_regularization_requeriments_on_convocation_id", using: :btree
  add_index "regularization_requeriments", ["unit_id"], name: "index_regularization_requeriments_on_unit_id", using: :btree

  create_table "ruims", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "seqcad"
    t.string   "motivo"
    t.string   "type_scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_agenda_schedules", force: :cascade do |t|
    t.integer  "agenda_id"
    t.date     "date"
    t.time     "hour"
    t.date     "born"
    t.string   "name"
    t.string   "cpf"
    t.string   "email"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "observation"
    t.text     "attendant_observation"
    t.integer  "status",                default: 0
    t.integer  "city_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "cnpj"
  end

  add_index "schedule_agenda_schedules", ["agenda_id"], name: "index_schedule_agenda_schedules_on_agenda_id", using: :btree
  add_index "schedule_agenda_schedules", ["city_id"], name: "index_schedule_agenda_schedules_on_city_id", using: :btree

  create_table "schedule_agendas", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "avatar"
    t.date     "start"
    t.date     "end"
    t.text     "disable_dates"
    t.time     "start_hour"
    t.time     "end_hour"
    t.integer  "attendance_time",  default: 15
    t.integer  "attendants"
    t.boolean  "weekend",          default: false
    t.boolean  "lunch_time",       default: false
    t.integer  "lunch_attendants"
    t.time     "lunch_start"
    t.time     "lunch_end"
    t.integer  "restriction_type", default: 0
    t.text     "restriction_sql"
    t.string   "location"
    t.integer  "program_id"
    t.integer  "staff_id"
    t.boolean  "status",           default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "local"
  end

  add_index "schedule_agendas", ["program_id"], name: "index_schedule_agendas_on_program_id", using: :btree
  add_index "schedule_agendas", ["staff_id"], name: "index_schedule_agendas_on_staff_id", using: :btree

  create_table "schedule_data_references", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "observation"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "schedule_data_references", ["code"], name: "index_schedule_data_references_on_code", using: :btree

  create_table "sefaz_allotments", force: :cascade do |t|
    t.integer  "staff_id"
    t.text     "error_message"
    t.datetime "send_date"
    t.integer  "send_staff_id"
    t.string   "protocol_return"
    t.integer  "exemption_type"
    t.string   "notifiers"
    t.string   "cnpj_notifiers"
    t.text     "observation"
    t.integer  "send_status_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "send_type"
  end

  add_index "sefaz_allotments", ["send_staff_id"], name: "index_sefaz_allotments_on_send_staff_id", using: :btree
  add_index "sefaz_allotments", ["send_status_id"], name: "index_sefaz_allotments_on_send_status_id", using: :btree
  add_index "sefaz_allotments", ["staff_id"], name: "index_sefaz_allotments_on_staff_id", using: :btree

  create_table "sefaz_exemptions", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "city"
    t.string   "address"
    t.string   "realty_number"
    t.string   "realty_value"
    t.integer  "allotment_id"
    t.string   "act_number"
    t.boolean  "canceled"
    t.datetime "canceled_date"
    t.integer  "canceled_staff_id"
    t.text     "return_message"
    t.integer  "staff_id"
    t.boolean  "unitary"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "system_message"
    t.integer  "year_act"
    t.string   "number_act_to_cancel"
  end

  add_index "sefaz_exemptions", ["allotment_id"], name: "index_sefaz_exemptions_on_allotment_id", using: :btree
  add_index "sefaz_exemptions", ["canceled_staff_id"], name: "index_sefaz_exemptions_on_canceled_staff_id", using: :btree
  add_index "sefaz_exemptions", ["staff_id"], name: "index_sefaz_exemptions_on_staff_id", using: :btree

  create_table "sefaz_send_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sefaz_transmission_candidates", force: :cascade do |t|
    t.integer  "transmission_id"
    t.string   "sector"
    t.string   "exemption_type"
    t.string   "organization"
    t.string   "cnpj"
    t.string   "name"
    t.string   "cpf"
    t.string   "city"
    t.string   "address"
    t.string   "unit_code"
    t.string   "unit_value"
    t.integer  "status",          default: 0
    t.string   "declaratory_act"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "sefaz_transmission_candidates", ["transmission_id"], name: "index_sefaz_transmission_candidates_on_transmission_id", using: :btree

  create_table "sefaz_transmissions", force: :cascade do |t|
    t.integer  "staff_id"
    t.string   "sector"
    t.string   "exemption_type"
    t.integer  "quantity",       default: 0
    t.integer  "status",         default: 0
    t.string   "csv"
    t.string   "xml"
    t.string   "sefaz_protocol"
    t.datetime "sent_in"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sefaz_transmissions", ["staff_id"], name: "index_sefaz_transmissions_on_staff_id", using: :btree

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

  create_table "visit_liftings", force: :cascade do |t|
    t.string   "localization"
    t.string   "seal"
    t.string   "name"
    t.string   "naturality"
    t.boolean  "sex"
    t.date     "born"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.date     "rg_org_date"
    t.string   "phone"
    t.string   "celphone"
    t.integer  "retirement"
    t.integer  "benefit"
    t.integer  "pension"
    t.string   "nis"
    t.string   "income"
    t.string   "spouse_name"
    t.date     "spouse_born"
    t.string   "spouse_cpf"
    t.string   "spouse_rg"
    t.string   "spouse_rg_org"
    t.date     "spouse_rg_org_date"
    t.integer  "deficiency"
    t.string   "deficiency_specification"
    t.integer  "civil_status"
    t.integer  "lot_situation"
    t.string   "lot_situation_time"
    t.integer  "busy_lot"
    t.integer  "busy_lot_user"
    t.integer  "lot_vacated"
    t.text     "lot_vacated_description"
    t.integer  "business_activities"
    t.text     "business_activities_description"
    t.integer  "contractual_purpose"
    t.text     "contractual_purpose_description"
    t.text     "additional_information"
    t.string   "geolocation"
    t.string   "photo_one"
    t.string   "photo_two"
    t.string   "photo_three"
    t.integer  "voi"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
