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

ActiveRecord::Schema.define(version: 20160618203509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "entries", force: :cascade do |t|
    t.integer  "sample_id",              null: false
    t.integer  "taxa_id",                null: false
    t.integer  "count",      default: 1
    t.string   "name",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "entries", ["response_data"], name: "entries_response_data", using: :gin
  add_index "entries", ["sample_id"], name: "index_entries_on_sample_id", using: :btree

  create_table "observations", force: :cascade do |t|
    t.datetime "date"
    t.integer  "protocol_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "observations", ["protocol_id"], name: "index_observations_on_protocol_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samples", force: :cascade do |t|
    t.integer  "subsite_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "samples", ["response_data"], name: "samples_response_data", using: :gin
  add_index "samples", ["subsite_id"], name: "index_samples_on_subsite_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "property_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sites", ["property_id"], name: "index_sites_on_property_id", using: :btree

  create_table "subsites", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "site_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subsites", ["site_id"], name: "index_subsites_on_site_id", using: :btree

  create_table "survey_fields", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "type",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_protocols", force: :cascade do |t|
    t.string   "title",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.json     "sample_fields"
    t.json     "entry_fields"
  end

  create_table "taxa", force: :cascade do |t|
    t.string   "family",      null: false
    t.string   "genus"
    t.string   "species"
    t.string   "common_name"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
