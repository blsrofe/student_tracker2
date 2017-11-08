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

ActiveRecord::Schema.define(version: 20171108022819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "klass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klass_id"], name: "index_enrollments_on_klass_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "title"
    t.string "school_year"
    t.string "description"
    t.bigint "user_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_klasses_on_student_id"
    t.index ["user_id"], name: "index_klasses_on_user_id"
  end

  create_table "observations", force: :cascade do |t|
    t.string "subject"
    t.string "ob_type"
    t.text "comment"
    t.date "date"
    t.boolean "parent_viewable", default: false
    t.bigint "student_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tone"
    t.index ["student_id"], name: "index_observations_on_student_id"
    t.index ["user_id"], name: "index_observations_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
  end

  create_table "student_parents", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_student_parents_on_parent_id"
    t.index ["student_id"], name: "index_student_parents_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "grade_level"
    t.text "notes"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "refresh_token"
  end

  add_foreign_key "enrollments", "klasses"
  add_foreign_key "enrollments", "students"
  add_foreign_key "klasses", "students"
  add_foreign_key "klasses", "users"
  add_foreign_key "observations", "students"
  add_foreign_key "observations", "users"
  add_foreign_key "student_parents", "parents"
  add_foreign_key "student_parents", "students"
end
