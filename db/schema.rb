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

ActiveRecord::Schema[8.1].define(version: 2026_04_28_081921) do
  create_table "attendance_records", force: :cascade do |t|
    t.datetime "clock_in_at"
    t.datetime "clock_out_at"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "employee_id", null: false
    t.text "notes"
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_attendance_records_on_employee_id"
  end

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

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_of_joining"
    t.integer "department_id", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.integer "position_id", null: false
    t.decimal "salary"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["position_id"], name: "index_employees_on_position_id"
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

  create_table "payslips", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "employee_id", null: false
    t.decimal "net_pay"
    t.date "period_month"
    t.integer "status"
    t.decimal "total_allowances"
    t.decimal "total_deductions"
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payslips_on_employee_id"
  end

  create_table "positions", force: :cascade do |t|
    t.decimal "base_salary"
    t.datetime "created_at", null: false
    t.integer "department_id", null: false
    t.integer "employee_type"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_positions_on_department_id"
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

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "employee_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_users_on_employee_id"
  end

  add_foreign_key "attendance_records", "employees"
  add_foreign_key "departments", "organizations"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "positions"
  add_foreign_key "payslips", "employees"
  add_foreign_key "positions", "departments"
  add_foreign_key "users", "employees"
end
