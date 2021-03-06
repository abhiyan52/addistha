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

ActiveRecord::Schema.define(version: 2019_02_21_183325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_agents", force: :cascade do |t|
    t.string "name"
    t.integer "manager_id"
    t.string "contact_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_add_agents_on_manager_id"
  end

  create_table "add_bids", force: :cascade do |t|
    t.integer "slot_id"
    t.integer "starting_bid_amount"
    t.integer "closing_bid_amount"
    t.integer "current_bid_amount"
    t.integer "agent_id"
    t.datetime "closing_time"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_add_bids_on_agent_id"
    t.index ["slot_id"], name: "index_add_bids_on_slot_id"
  end

  create_table "add_slots", force: :cascade do |t|
    t.datetime "slot_end_time"
    t.integer "agency_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_add_slots_on_agency_id"
  end

  create_table "add_space_agencies", force: :cascade do |t|
    t.string "name"
    t.integer "manager_id"
    t.string "contact_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_add_space_agencies_on_manager_id"
  end

  create_table "advertisement_slots", force: :cascade do |t|
    t.integer "agent_id", null: false
    t.integer "organization_id"
    t.integer "advertisement_id", null: false
    t.integer "selling_price", default: 0
    t.integer "buying_price", null: false
    t.string "status", default: "onsale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_advertisement_slots_on_advertisement_id"
    t.index ["agent_id"], name: "index_advertisement_slots_on_agent_id"
    t.index ["organization_id"], name: "index_advertisement_slots_on_organization_id"
  end

  create_table "advertisements", force: :cascade do |t|
    t.datetime "slot_start_time"
    t.datetime "slot_end_time"
    t.integer "agency_id"
    t.string "status", default: "idle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "base_price"
    t.datetime "bid_start_time"
    t.datetime "bid_end_time"
    t.index ["agency_id"], name: "index_advertisements_on_agency_id"
  end

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "manager_id"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_agencies_on_manager_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact_number"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_agents_on_manager_id"
  end

  create_table "bids", force: :cascade do |t|
    t.integer "advertisement_id", null: false
    t.string "agent_id", null: false
    t.integer "bid_amount", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_bids_on_advertisement_id"
    t.index ["agent_id"], name: "index_bids_on_agent_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact_number"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_organizations_on_manager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "contact_number", null: false
    t.string "email", null: false
    t.integer "user_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
