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

ActiveRecord::Schema.define(version: 20170608181551) do

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
    t.text "planned_date_and_location"
    t.text "description_and_purpose"
    t.text "required_resources"
    t.text "list_of_previous_occurrences"
    t.text "other_subjects_collaboraiton"
    t.text "targets"
    t.text "strategy_of_getting_sponsors"
    t.text "planned_advertisement"
    t.text "current_state"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "coordinators_projects", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "function", default: "", null: false
    t.date "date", null: false
    t.integer "budget", default: 0, null: false
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_coordinators_projects_on_application_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.date "time_of_establishment", null: false
    t.bigint "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_organizations_on_faculty_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.string "function", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_project_members_on_application_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.string "todo", default: "", null: false
    t.date "start_date", null: false
    t.date "due_date", null: false
    t.string "finance_source", default: "", null: false
    t.integer "budget_amount", default: 0, null: false
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_schedule_items_on_application_id"
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
    t.boolean "has_training", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "users"
  add_foreign_key "coordinators_projects", "applications"
  add_foreign_key "organizations", "faculties"
  add_foreign_key "project_members", "applications"
  add_foreign_key "schedule_items", "applications"
end
