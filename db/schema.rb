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

ActiveRecord::Schema.define(version: 20160308063043) do

  create_table "brand_users", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "brand_id",   limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "brands", force: :cascade do |t|
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "brand_name",                 limit: 255
    t.string   "brand_address_1",            limit: 255
    t.string   "brand_address_2",            limit: 255
    t.string   "brand_city",                 limit: 255
    t.string   "brand_state",                limit: 255
    t.string   "brand_zipcode",              limit: 255
    t.string   "brand_phone_number",         limit: 255
    t.text     "brand_business_description", limit: 65535
    t.text     "brand_service_description",  limit: 65535
    t.string   "brand_industry",             limit: 255
    t.string   "primary_color",              limit: 255
    t.string   "secondary_color",            limit: 255
    t.string   "tertiary_color",             limit: 255
  end

  create_table "contents", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "content_name",     limit: 255
    t.string   "content_category", limit: 255
    t.integer  "contentable_id",   limit: 4
    t.string   "contentable_type", limit: 255
    t.text     "content_field",    limit: 65535
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "imageable_id",   limit: 4
    t.string   "imageable_type", limit: 255
    t.string   "image_name",     limit: 255
    t.string   "image_category", limit: 255
    t.string   "image_path",     limit: 255
    t.string   "image",          limit: 255
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "business_name",        limit: 255
    t.string   "address_1",            limit: 255
    t.string   "address_2",            limit: 255
    t.string   "city",                 limit: 255
    t.string   "state",                limit: 255
    t.string   "zipcode",              limit: 255
    t.string   "hours_of_operation",   limit: 255
    t.text     "business_description", limit: 65535
    t.text     "service_description",  limit: 65535
    t.string   "areas_served",         limit: 255
    t.string   "zipcodes_served",      limit: 255
    t.string   "languages",            limit: 255
    t.string   "meta_description",     limit: 255
    t.string   "meta_keywords",        limit: 255
    t.string   "meta_title",           limit: 255
    t.string   "meta_url",             limit: 255
    t.string   "phone_number",         limit: 255
    t.integer  "brand_id",             limit: 4
    t.string   "type",                 limit: 255
    t.float    "latitude",             limit: 24
    t.float    "longitude",            limit: 24
    t.string   "tagline_title",        limit: 255
    t.string   "tagline_summary",      limit: 255
    t.string   "email",                limit: 255
    t.string   "slug",                 limit: 255
  end

  add_index "locations", ["slug"], name: "index_locations_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
