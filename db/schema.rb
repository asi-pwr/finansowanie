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

ActiveRecord::Schema.define(version: 20180124001215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "coordinator", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_applied_for"
    t.integer "amount_other_sources"
    t.integer "amount_overall"
    t.text "project_subject"
    t.text "description"
    t.text "required_resources"
    t.text "past_schedule"
    t.text "collaboration"
    t.text "target_group"
    t.text "sponsor_enlistment"
    t.text "promotion_plans"
    t.text "current_state"
    t.bigint "organization_id"
    t.text "location"
    t.date "date"
    t.text "estimate"
    t.index ["organization_id"], name: "index_applications_on_organization_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "project_name"
    t.string "role"
    t.date "project_date"
    t.integer "budget"
    t.bigint "user_id"
    t.bigint "application_id"
    t.index ["application_id"], name: "index_experiences_on_application_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.date "time_of_establishment"
    t.bigint "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_organizations_on_faculty_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "member_role"
    t.string "first_name"
    t.string "last_name"
    t.bigint "application_id"
    t.index ["application_id"], name: "index_roles_on_application_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.string "todo", default: "", null: false
    t.date "start_date", null: false
    t.date "due_date", null: false
    t.string "finance_source", default: "", null: false
    t.integer "budget_amount", null: false
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_schedule_items_on_application_id"
  end

  create_table "user_applications", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "application_id"
    t.bigint "role_id"
    t.index ["application_id"], name: "index_user_applications_on_application_id"
    t.index ["role_id"], name: "index_user_applications_on_role_id"
    t.index ["user_id"], name: "index_user_applications_on_user_id"
  end

  create_table "user_organizations", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_user_organizations_on_organization_id"
    t.index ["user_id"], name: "index_user_organizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "full_name", default: "", null: false
    t.string "student_id", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "faculty_id"
    t.string "phone_number"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["faculty_id"], name: "index_users_on_faculty_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "organizations"
  add_foreign_key "applications", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "organizations", "faculties"
  add_foreign_key "schedule_items", "applications"
  add_foreign_key "users", "faculties"
end
