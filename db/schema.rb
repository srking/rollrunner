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

ActiveRecord::Schema.define(version: 20150717232751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cafe_ingredients", force: :cascade do |t|
    t.integer  "cafe_id"
    t.integer  "ingredient_id"
    t.decimal  "price",         precision: 10, scale: 2
    t.decimal  "doubler_price", precision: 10, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "cafe_ingredients", ["cafe_id"], name: "index_cafe_ingredients_on_cafe_id", using: :btree
  add_index "cafe_ingredients", ["ingredient_id"], name: "index_cafe_ingredients_on_ingredient_id", using: :btree

  create_table "cafes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.integer  "domain_id"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "order"
    t.integer  "orderers_id"
  end

  add_index "orders", ["domain_id"], name: "index_orders_on_domain_id", using: :btree
  add_index "orders", ["owner_id"], name: "index_orders_on_owner_id", using: :btree

  create_table "roll_ingredients", force: :cascade do |t|
    t.integer  "roll_id"
    t.integer  "ingredient_id"
    t.boolean  "include",       default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "roll_ingredients", ["ingredient_id"], name: "index_roll_ingredients_on_ingredient_id", using: :btree
  add_index "roll_ingredients", ["roll_id"], name: "index_roll_ingredients_on_roll_id", using: :btree

  create_table "rolls", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rolls", ["order_id"], name: "index_rolls_on_order_id", using: :btree
  add_index "rolls", ["user_id"], name: "index_rolls_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "given_name"
    t.string   "family_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "domain_id"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["domain_id"], name: "index_users_on_domain_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cafe_ingredients", "cafes"
  add_foreign_key "cafe_ingredients", "ingredients"
  add_foreign_key "orders", "domains"
  add_foreign_key "orders", "users", column: "owner_id"
  add_foreign_key "roll_ingredients", "ingredients"
  add_foreign_key "roll_ingredients", "rolls"
  add_foreign_key "rolls", "orders"
  add_foreign_key "rolls", "users"
  add_foreign_key "users", "domains"
end
