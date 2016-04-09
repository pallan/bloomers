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

ActiveRecord::Schema.define(version: 20160409155719) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "plant_id",   limit: 4
    t.integer  "quantity",   limit: 4
    t.integer  "price",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",    limit: 4
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "customer_name",  limit: 255
    t.string   "customer_phone", limit: 255
    t.string   "payment_method", limit: 255
    t.integer  "cheque_number",  limit: 4
    t.string   "status",         limit: 15
    t.decimal  "payment_amount",             precision: 10, scale: 2, default: 0.0, null: false
    t.integer  "group_id",       limit: 4
  end

  add_index "orders", ["group_id"], name: "index_orders_on_group_id", using: :btree

  create_table "plants", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "price",       limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "active",                  default: true
    t.integer  "category_id", limit: 4
  end

end
