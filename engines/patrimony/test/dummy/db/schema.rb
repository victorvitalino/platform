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

ActiveRecord::Schema.define(version: 20150611162627) do

  create_table "patrimony_drives", force: :cascade do |t|
    t.date     "date_drive"
    t.integer  "sector_old"
    t.integer  "user_old"
    t.integer  "sector_id"
    t.integer  "user_id"
    t.integer  "patrimony_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "patrimony_drives", ["patrimony_id"], name: "index_patrimony_drives_on_patrimony_id"
  add_index "patrimony_drives", ["sector_id"], name: "index_patrimony_drives_on_sector_id"
  add_index "patrimony_drives", ["user_id"], name: "index_patrimony_drives_on_user_id"

  create_table "patrimony_materials", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "type_material_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "patrimony_materials", ["type_material_id"], name: "index_patrimony_materials_on_type_material_id"

  create_table "patrimony_patrimonies", force: :cascade do |t|
    t.string   "code_patrimony"
    t.date     "date_acquisition"
    t.boolean  "status"
    t.integer  "sector_id"
    t.integer  "user_id"
    t.integer  "material_id"
    t.integer  "property_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "patrimony_patrimonies", ["material_id"], name: "index_patrimony_patrimonies_on_material_id"
  add_index "patrimony_patrimonies", ["property_id"], name: "index_patrimony_patrimonies_on_property_id"
  add_index "patrimony_patrimonies", ["sector_id"], name: "index_patrimony_patrimonies_on_sector_id"
  add_index "patrimony_patrimonies", ["user_id"], name: "index_patrimony_patrimonies_on_user_id"

  create_table "patrimony_properties", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patrimony_serial_numbers", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "patrimony_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "patrimony_serial_numbers", ["patrimony_id"], name: "index_patrimony_serial_numbers_on_patrimony_id"

  create_table "patrimony_type_materials", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "percentage"
    t.integer  "life_cycle"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
