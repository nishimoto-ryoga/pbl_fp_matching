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

ActiveRecord::Schema.define(version: 2021_05_26_124149) do

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "planners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_planners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_planners_on_reset_password_token", unique: true
  end

  create_table "reservation_frames", force: :cascade do |t|
    t.date "date"
    t.datetime "canceled_at"
    t.integer "planner_id", null: false
    t.integer "time_frame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planner_id"], name: "index_reservation_frames_on_planner_id"
    t.index ["time_frame_id"], name: "index_reservation_frames_on_time_frame_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "reservation_frame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id", "reservation_frame_id"], name: "index_reservations_on_client_id_and_reservation_frame_id", unique: true
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["reservation_frame_id"], name: "index_reservations_on_reservation_frame_id"
  end

  create_table "time_frames", force: :cascade do |t|
    t.string "start_at", null: false
    t.string "end_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["start_at", "end_at"], name: "index_time_frames_on_start_at_and_end_at", unique: true
  end

  add_foreign_key "reservation_frames", "planners"
  add_foreign_key "reservation_frames", "time_frames"
  add_foreign_key "reservations", "clients"
  add_foreign_key "reservations", "reservation_frames"
end
