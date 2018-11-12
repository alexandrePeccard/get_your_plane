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

ActiveRecord::Schema.define(version: 2018_11_11_151240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "airport_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "flight_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "bookings_passengers", id: false, force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "passenger_id"
    t.index ["booking_id"], name: "index_bookings_passengers_on_booking_id"
    t.index ["passenger_id"], name: "index_bookings_passengers_on_passenger_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "max_seats"
    t.integer "available_seats"
    t.float "duration"
    t.date "departure_date"
    t.integer "departure_hour"
    t.integer "departure_minutes"
    t.date "arrival_date"
    t.integer "arrival_hour"
    t.integer "arrival_minutes"
    t.bigint "departure_id"
    t.bigint "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departure_id"], name: "index_flights_on_departure_id"
    t.index ["destination_id"], name: "index_flights_on_destination_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings_passengers", "bookings"
  add_foreign_key "bookings_passengers", "passengers"
end
