# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_21_012516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.date "date_absence"
    t.boolean "status", default: false
    t.bigint "grid_id", null: false
    t.bigint "enrollment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enrollment_id"], name: "index_absences_on_enrollment_id"
    t.index ["grid_id"], name: "index_absences_on_grid_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.string "name"
    t.integer "weight", default: 0
    t.bigint "grid_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grid_id"], name: "index_assessments_on_grid_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "start_year"
    t.datetime "end_year"
    t.string "period", limit: 2
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_classrooms_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "titration"
    t.string "amount_periods_months", limit: 3
    t.string "workload"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_disciplines_on_course_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "classroom_id", null: false
    t.string "period", limit: 2
    t.text "description"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_enrollments_on_classroom_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "grids", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "discipline_id", null: false
    t.bigint "classroom_id", null: false
    t.bigint "period_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_grids_on_classroom_id"
    t.index ["discipline_id"], name: "index_grids_on_discipline_id"
    t.index ["period_id"], name: "index_grids_on_period_id"
    t.index ["teacher_id"], name: "index_grids_on_teacher_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "periods", force: :cascade do |t|
    t.time "start_period"
    t.time "end_period"
    t.string "type_period", limit: 15
    t.string "day_of_class", limit: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status", default: false
    t.index ["cnpj"], name: "index_schools_on_cnpj", unique: true
  end

  create_table "student_assessments", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.bigint "enrollment_id", null: false
    t.integer "weight", default: 0
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assessment_id"], name: "index_student_assessments_on_assessment_id"
    t.index ["enrollment_id"], name: "index_student_assessments_on_enrollment_id"
  end

  create_table "student_boletims", force: :cascade do |t|
    t.bigint "enrollment_id", null: false
    t.bigint "grid_id", null: false
    t.integer "total", default: 0
    t.boolean "is_approved", default: false
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enrollment_id"], name: "index_student_boletims_on_enrollment_id"
    t.index ["grid_id"], name: "index_student_boletims_on_grid_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "cpf", limit: 15
    t.boolean "status", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_students_on_cpf", unique: true
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "cpf", limit: 15
    t.boolean "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_teachers_on_cpf", unique: true
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "jti", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "absences", "enrollments"
  add_foreign_key "absences", "grids"
  add_foreign_key "assessments", "grids"
  add_foreign_key "classrooms", "courses"
  add_foreign_key "disciplines", "courses"
  add_foreign_key "enrollments", "classrooms"
  add_foreign_key "enrollments", "students"
  add_foreign_key "grids", "classrooms"
  add_foreign_key "grids", "disciplines"
  add_foreign_key "grids", "periods"
  add_foreign_key "grids", "teachers"
  add_foreign_key "student_assessments", "assessments"
  add_foreign_key "student_assessments", "enrollments"
  add_foreign_key "student_boletims", "enrollments"
  add_foreign_key "student_boletims", "grids"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
end
