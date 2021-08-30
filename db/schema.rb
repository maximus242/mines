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

ActiveRecord::Schema.define(version: 2021_08_30_035959) do

  create_table "blanks", charset: "utf8mb3", force: :cascade do |t|
    t.text "string"
    t.integer "length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "boards", charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.integer "width"
    t.integer "height"
    t.integer "number_of_mines"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "array"
    t.text "blank"
  end

  create_table "mines", charset: "utf8mb3", force: :cascade do |t|
    t.integer "width"
    t.integer "height"
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id", "height", "width"], name: "index_mines_on_board_id_and_height_and_width"
    t.index ["board_id", "width", "height"], name: "index_mines_on_board_id_and_width_and_height", unique: true
    t.index ["board_id"], name: "index_mines_on_board_id"
  end

  add_foreign_key "mines", "boards"
end
