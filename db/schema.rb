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

ActiveRecord::Schema.define(version: 20151214161852) do

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
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "firm_enterprise_id"
  end

  add_index "address_units", ["city_id"], name: "index_address_units_on_city_id", using: :btree
  add_index "address_units", ["firm_enterprise_id"], name: "index_address_units_on_firm_enterprise_id", using: :btree
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

  create_table "attendance_counter_subjects", force: :cascade do |t|
    t.integer  "counter_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendance_counter_subjects", ["counter_id"], name: "index_attendance_counter_subjects_on_counter_id", using: :btree
  add_index "attendance_counter_subjects", ["subject_id"], name: "index_attendance_counter_subjects_on_subject_id", using: :btree

  create_table "attendance_counters", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "counter_subject_id"
    t.boolean  "preference",         default: false
    t.boolean  "status",             default: false
    t.integer  "number",             default: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "attendance_counters", ["counter_subject_id"], name: "index_attendance_counters_on_counter_subject_id", using: :btree
  add_index "attendance_counters", ["station_id"], name: "index_attendance_counters_on_station_id", using: :btree

  create_table "attendance_station_attendants", force: :cascade do |t|
    t.integer  "attendant_id"
    t.integer  "station_id"
    t.boolean  "status",       default: false
    t.boolean  "supervisor",   default: false
    t.integer  "counter_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
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

  create_table "candidate_cadastre_addresses", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "unit_id"
    t.string   "dominial_chain"
    t.integer  "type_occurrence"
    t.string   "observation"
    t.integer  "type_receipt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "candidate_cadastre_addresses", ["cadastre_id"], name: "index_candidate_cadatre_addresses_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_addresses", ["cadastre_mirror_id"], name: "index_candidate_cadatre_addresses_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_addresses", ["unit_id"], name: "index_candidate_cadatre_addresses_on_unit_id", using: :btree

  create_table "candidate_cadastre_checklists", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "attendance_id"
    t.integer  "checklist_id",               array: true
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "candidate_cadastre_checklists", ["attendance_id"], name: "index_candidate_cadastre_checklists_on_attendance_id", using: :btree
  add_index "candidate_cadastre_checklists", ["cadastre_id"], name: "index_candidate_cadastre_checklists_on_cadastre_id", using: :btree

  create_table "candidate_cadastre_mirrors", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf",                    default: "", null: false
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
    t.integer  "cadastre_type",          default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "candidate_cadastre_mirrors", ["cadastre_id"], name: "index_candidate_cadastre_mirrors_on_cadastre_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["city_id"], name: "index_candidate_cadastre_mirrors_on_city_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["civil_state_id"], name: "index_candidate_cadastre_mirrors_on_civil_state_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["program_id"], name: "index_candidate_cadastre_mirrors_on_program_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["special_condition_id"], name: "index_candidate_cadastre_mirrors_on_special_condition_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["state_id"], name: "index_candidate_cadastre_mirrors_on_state_id", using: :btree
  add_index "candidate_cadastre_mirrors", ["work_city_id"], name: "index_candidate_cadastre_mirrors_on_work_city_id", using: :btree

  create_table "candidate_cadastre_procedurals", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "cadastre_id"
    t.integer  "procedural_status_id"
    t.integer  "convocation_id"
    t.integer  "assessment_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "candidate_cadastre_procedurals", ["assessment_id"], name: "index_candidate_cadastre_procedurals_on_assessment_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["cadastre_mirror_id"], name: "index_candidate_cadastre_procedurals_on_cadastre_mirror_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["convocation_id"], name: "index_candidate_cadastre_procedurals_on_convocation_id", using: :btree
  add_index "candidate_cadastre_procedurals", ["procedural_status_id"], name: "index_candidate_cadastre_procedurals_on_procedural_status_id", using: :btree

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
    t.string   "cpf",                    default: "", null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "candidate_cadastres", ["city_id"], name: "index_candidate_cadastres_on_city_id", using: :btree
  add_index "candidate_cadastres", ["civil_state_id"], name: "index_candidate_cadastres_on_civil_state_id", using: :btree
  add_index "candidate_cadastres", ["cpf"], name: "index_candidate_cadastres_on_cpf", unique: true, using: :btree
  add_index "candidate_cadastres", ["program_id"], name: "index_candidate_cadastres_on_program_id", using: :btree
  add_index "candidate_cadastres", ["remember_token"], name: "index_candidate_cadastres_on_remember_token", unique: true, using: :btree
  add_index "candidate_cadastres", ["special_condition_id"], name: "index_candidate_cadastres_on_special_condition_id", using: :btree
  add_index "candidate_cadastres", ["state_id"], name: "index_candidate_cadastres_on_state_id", using: :btree
  add_index "candidate_cadastres", ["work_city_id"], name: "index_candidate_cadastres_on_work_city_id", using: :btree

  create_table "candidate_checklists", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.integer  "program_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "candidate_checklists", ["program_id"], name: "index_candidate_checklists_on_program_id", using: :btree

  create_table "candidate_civil_states", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
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
  end

  add_index "candidate_convocations", ["pontuation_code_id"], name: "index_candidate_convocations_on_pontuation_code_id", using: :btree

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
  end

  add_index "candidate_lists", ["slug"], name: "index_candidate_lists_on_slug", unique: true, using: :btree

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

  create_table "candidate_situation_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "candidate_situation_statuses", ["code"], name: "index_candidate_situation_statuses_on_code", unique: true, using: :btree

  create_table "candidate_special_conditions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cms_galleries", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "status"
    t.string   "thumbnail"
    t.string   "photo",      default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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
  end

  add_index "cms_posts", ["post_category_id"], name: "index_cms_posts_on_post_category_id", using: :btree

  create_table "cms_videos", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.boolean  "publish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "order",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
  end

  add_index "concourse_subscribes", ["project_id"], name: "index_concourse_subscribes_on_project_id", using: :btree
  add_index "concourse_subscribes", ["type_guide_id"], name: "index_concourse_subscribes_on_type_guide_id", using: :btree

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
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
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
    t.date     "born"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "certificate_civil_criminal"
    t.boolean  "status",                     default: true
    t.integer  "member_job_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "entity_members", ["cadastre_id"], name: "index_entity_members_on_cadastre_id", using: :btree
  add_index "entity_members", ["cpf", "cadastre_id"], name: "index_entity_members_on_cpf_and_cadastre_id", unique: true, using: :btree
  add_index "entity_members", ["member_job_id"], name: "index_entity_members_on_member_job_id", using: :btree

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
  end

  add_index "firm_enterprise_statuses", ["cadastre_id"], name: "index_firm_enterprise_statuses_on_cadastre_id", using: :btree
  add_index "firm_enterprise_statuses", ["enterprise_cadastre_id"], name: "index_firm_enterprise_statuses_on_enterprise_cadastre_id", using: :btree
  add_index "firm_enterprise_statuses", ["status_cadastre_id"], name: "index_firm_enterprise_statuses_on_status_cadastre_id", using: :btree

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

  create_table "helpdesk_ticket_comments", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "user_type"
    t.text     "comment"
    t.boolean  "read"
    t.datetime "read_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "helpdesk_ticket_comments", ["ticket_id"], name: "index_helpdesk_ticket_comments_on_ticket_id", using: :btree

  create_table "helpdesk_ticket_subjects", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
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
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "helpdesk_tickets", ["attendant_id"], name: "index_helpdesk_tickets_on_attendant_id", using: :btree
  add_index "helpdesk_tickets", ["requester_id"], name: "index_helpdesk_tickets_on_requester_id", using: :btree
  add_index "helpdesk_tickets", ["sector_id"], name: "index_helpdesk_tickets_on_sector_id", using: :btree
  add_index "helpdesk_tickets", ["ticket_subject_id"], name: "index_helpdesk_tickets_on_ticket_subject_id", using: :btree
  add_index "helpdesk_tickets", ["ticket_type_id"], name: "index_helpdesk_tickets_on_ticket_type_id", using: :btree

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
  end

  add_index "person_staffs", ["branch_line_id"], name: "index_person_staffs_on_branch_line_id", using: :btree
  add_index "person_staffs", ["code"], name: "index_person_staffs_on_code", unique: true, using: :btree
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

  create_table "sefaz_allotment_candidates", force: :cascade do |t|
    t.integer  "allotment_id"
    t.string   "sector"
    t.integer  "exemption_type", default: 0
    t.string   "organization"
    t.string   "cnpj"
    t.string   "name"
    t.string   "cpf"
    t.string   "city"
    t.string   "address"
    t.string   "unit_code"
    t.float    "unit_value"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sefaz_allotment_candidates", ["allotment_id"], name: "index_sefaz_allotment_candidates_on_allotment_id", using: :btree

  create_table "sefaz_allotments", force: :cascade do |t|
    t.integer  "staff_id"
    t.string   "sector"
    t.integer  "exemption_type", default: 0
    t.integer  "quantity",       default: 0
    t.integer  "status",         default: 0
    t.string   "csv_archive"
    t.string   "xml_archive"
    t.string   "sefaz_protocol"
    t.datetime "send"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sefaz_allotments", ["staff_id"], name: "index_sefaz_allotments_on_staff_id", using: :btree

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

end
