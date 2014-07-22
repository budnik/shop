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

ActiveRecord::Schema.define(version: 20140722174411) do

  create_table "prices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "subcategory"
    t.string   "code"
    t.string   "model_name"
    t.string   "vendor"
    t.string   "stock"
    t.integer  "prices",      default: 0, null: false
    t.integer  "warranty"
    t.integer  "price_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["price_id"], name: "index_products_on_price_id"

end
