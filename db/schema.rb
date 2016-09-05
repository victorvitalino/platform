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

ActiveRecord::Schema.define(version: 20160831193938) do

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
    t.string   "report"
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
    t.string   "target_model_name"
    t.string   "target_model_function"
    t.integer  "target_model_id"
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

  create_table "candidate_validations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.string   "target_model_query"
    t.string   "target_model_function"
    t.boolean  "contain",                 default: true
    t.text     "program_id",                                          array: true
    t.integer  "occurrence_situation_id"
    t.boolean  "status",                  default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "candidate_validations", ["occurrence_situation_id"], name: "index_candidate_validations_on_occurrence_situation_id", using: :btree

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

  create_table "concourse_resources", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "message"
    t.integer  "candidate_id"
    t.integer  "situation",    default: 0
    t.text     "observation"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "concourse_resources", ["candidate_id"], name: "index_concourse_resources_on_candidate_id", using: :btree
  add_index "concourse_resources", ["project_id"], name: "index_concourse_resources_on_project_id", using: :btree

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

  create_table "concourse_team_participations", force: :cascade do |t|
    t.integer  "candidate_participation_id"
    t.string   "name"
    t.integer  "job"
    t.string   "observation"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "concourse_team_participations", ["candidate_participation_id"], name: "cand_part_id", using: :btree

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

  create_table "core_navs", force: :cascade do |t|
    t.integer  "order"
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.boolean  "only_admin"
    t.integer  "code"
    t.integer  "system_module_id"
    t.integer  "staff_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "core_navs", ["staff_id"], name: "index_core_navs_on_staff_id", using: :btree
  add_index "core_navs", ["system_module_id"], name: "index_core_navs_on_system_module_id", using: :btree

