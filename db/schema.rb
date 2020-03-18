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

ActiveRecord::Schema.define(version: 2020_03_18_182441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "black_cards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "text", null: false
    t.integer "pick", null: false
    t.bigint "card_set_id", null: false
    t.index ["card_set_id"], name: "index_black_cards_on_card_set_id"
  end

  create_table "card_sets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
  end

  create_table "cognito_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "expire_time", null: false
    t.integer "issued_at", null: false
    t.string "audience", null: false
    t.string "refresh_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cognito_sessions_on_user_id"
  end

  create_table "game_card_sets", force: :cascade do |t|
    t.bigint "card_set_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_set_id"], name: "index_game_card_sets_on_card_set_id"
    t.index ["game_id"], name: "index_game_card_sets_on_game_id"
  end

  create_table "game_rounds", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_id", null: false
    t.bigint "black_card_id", null: false
    t.integer "round", null: false
    t.integer "status", null: false
    t.bigint "user_id", null: false
    t.datetime "started_at"
    t.datetime "closed_at"
    t.datetime "ended_at"
    t.bigint "user_card_id"
    t.index ["black_card_id"], name: "index_game_rounds_on_black_card_id"
    t.index ["game_id"], name: "index_game_rounds_on_game_id"
    t.index ["user_card_id"], name: "index_game_rounds_on_user_card_id"
    t.index ["user_id"], name: "index_game_rounds_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.string "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "user_cards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "white_card_id", null: false
    t.bigint "user_game_id", null: false
    t.index ["user_game_id"], name: "index_user_cards_on_user_game_id"
    t.index ["white_card_id"], name: "index_user_cards_on_white_card_id"
  end

  create_table "user_games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.datetime "joined_at"
    t.datetime "left_at"
    t.index ["game_id"], name: "index_user_games_on_game_id"
    t.index ["user_id"], name: "index_user_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number", null: false
    t.string "name"
  end

  create_table "white_cards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "text", null: false
    t.bigint "card_set_id", null: false
    t.index ["card_set_id"], name: "index_white_cards_on_card_set_id"
  end

  add_foreign_key "black_cards", "card_sets"
  add_foreign_key "game_card_sets", "card_sets"
  add_foreign_key "game_card_sets", "games"
  add_foreign_key "game_rounds", "black_cards"
  add_foreign_key "game_rounds", "games"
  add_foreign_key "game_rounds", "user_cards"
  add_foreign_key "game_rounds", "users"
  add_foreign_key "games", "users"
  add_foreign_key "user_cards", "user_games"
  add_foreign_key "user_cards", "white_cards"
  add_foreign_key "user_games", "games"
  add_foreign_key "user_games", "users"
  add_foreign_key "white_cards", "card_sets"
end
