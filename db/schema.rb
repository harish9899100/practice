# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_28_065826) do
  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.integer "organization_id", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_departments_on_organization_id"
  end

  create_table "inventory_logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "product"
    t.integer "quantity_change"
    t.text "reason"
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "settings"
    t.string "slug"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.boolean "featured"
    t.string "name"
    t.integer "price"
    t.string "sku"
    t.integer "stock_count"
    t.datetime "updated_at", null: false
    t.index ["sku"], name: "index_products_on_sku", unique: true
  end

  add_foreign_key "departments", "organizations"
end
