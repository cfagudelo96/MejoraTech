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

ActiveRecord::Schema.define(version: 20171225191448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amef_analyses", force: :cascade do |t|
    t.integer "fishbone_analysis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amef_components", force: :cascade do |t|
    t.integer "amef_analysis_id"
    t.integer "fishbone_cause_id"
    t.integer "severity", default: 1
    t.integer "frequency", default: 1
    t.integer "detectability", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.integer "product_id"
    t.text "description"
    t.integer "employee_id"
    t.integer "classification"
    t.string "source"
    t.string "batch_number"
    t.date "expiration_date"
    t.date "effective_date"
    t.date "review_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source_email"
    t.text "source_contact_info"
    t.integer "contact_employee_id"
    t.string "code"
    t.integer "company"
    t.integer "status"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "identification"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_employees_on_confirmation_token", unique: true
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "fishbone_analyses", force: :cascade do |t|
    t.integer "complaint_id"
    t.string "effect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishbone_categories", force: :cascade do |t|
    t.integer "fishbone_analysis_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishbone_causes", force: :cascade do |t|
    t.integer "fishbone_category_id"
    t.string "cause"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "five_m_analyses", force: :cascade do |t|
    t.integer "complaint_id"
    t.text "consequence"
    t.text "manpower"
    t.text "machines"
    t.text "materials"
    t.text "methods"
    t.text "management"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supports", force: :cascade do |t|
    t.string "support_file"
    t.text "description"
    t.integer "complaint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
