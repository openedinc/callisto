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

ActiveRecord::Schema.define(version: 20171129222338) do

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
    t.string   "group_id"
    t.integer  "caliper_event_id"
    t.datetime "event_time"
    t.index ["actor_id"], name: "index_assessment_events_on_actor_id", using: :btree
    t.index ["caliper_event_id"], name: "index_assessment_events_on_caliper_event_id", using: :btree
    t.index ["generated_id"], name: "index_assessment_events_on_generated_id", using: :btree
    t.index ["group_id"], name: "index_assessment_events_on_group_id", using: :btree
    t.index ["object_id"], name: "index_assessment_events_on_object_id", using: :btree
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
    t.string   "group_id"
    t.integer  "caliper_event_id"
    t.datetime "event_time"
    t.float    "generated_score"
    t.index ["actor_id"], name: "index_assessment_item_events_on_actor_id", using: :btree
    t.index ["caliper_event_id"], name: "index_assessment_item_events_on_caliper_event_id", using: :btree
    t.index ["generated_id"], name: "index_assessment_item_events_on_generated_id", using: :btree
    t.index ["group_id"], name: "index_assessment_item_events_on_group_id", using: :btree
    t.index ["object_id"], name: "index_assessment_item_events_on_object_id", using: :btree
  end

  create_table "caliper_events", force: :cascade do |t|
    t.jsonb    "payload"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "routed"
  end

  create_table "grade_events", force: :cascade do |t|
    t.string   "actor_id"
    t.string   "action"
    t.string   "object_id"
    t.string   "assignable_id"
    t.integer  "assignable_max_score"
    t.string   "assignable_is_part_of"
    t.string   "generated_id"
    t.integer  "generated_total_score"
    t.string   "generated_scored_by"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "caliper_event_id"
    t.datetime "event_time"
    t.index ["actor_id"], name: "index_grade_events_on_actor_id", using: :btree
    t.index ["assignable_id"], name: "index_grade_events_on_assignable_id", using: :btree
    t.index ["caliper_event_id"], name: "index_grade_events_on_caliper_event_id", using: :btree
    t.index ["generated_id"], name: "index_grade_events_on_generated_id", using: :btree
    t.index ["object_id"], name: "index_grade_events_on_object_id", using: :btree
  end

  create_table "media_events", force: :cascade do |t|
    t.string   "actor_id"
    t.string   "action"
    t.string   "object_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "group_id"
    t.integer  "caliper_event_id"
    t.datetime "event_time"
    t.index ["actor_id"], name: "index_media_events_on_actor_id", using: :btree
    t.index ["caliper_event_id"], name: "index_media_events_on_caliper_event_id", using: :btree
    t.index ["group_id"], name: "index_media_events_on_group_id", using: :btree
    t.index ["object_id"], name: "index_media_events_on_object_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
