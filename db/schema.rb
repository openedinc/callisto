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

ActiveRecord::Schema.define(version: 20170421173055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_events", force: :cascade do |t|
    t.string   "actor_id"
    t.string   "action"
    t.string   "object_id"
    t.string   "generated_id"
    t.datetime "generated_ended_at_time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "assessment_item_events", force: :cascade do |t|
    t.string   "actor_id"
    t.string   "action"
    t.string   "object_id"
    t.integer  "max_score"
    t.string   "is_part_of"
    t.string   "generated_id"
    t.integer  "generated_count"
    t.datetime "generated_started_at_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "caliper_events", force: :cascade do |t|
    t.jsonb    "payload"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "routed"
  end

  create_table "media_events", force: :cascade do |t|
    t.string   "actor_id"
    t.string   "action"
    t.string   "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outcome_events", force: :cascade do |t|
    t.string   "actor_id"
    t.string   "action"
    t.string   "object_id"
    t.string   "assignable_id"
    t.integer  "assignable_max_score"
    t.string   "assignable_is_part_of"
    t.string   "generated_count"
    t.integer  "generated_total_score"
    t.string   "generated_scored_by"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
