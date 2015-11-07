# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151027204820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "betslips", force: :cascade do |t|
    t.integer  "winnings_cents", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "bookmakers", force: :cascade do |t|
    t.integer  "odd_type_id"
    t.integer  "api_id"
    t.string   "name"
    t.decimal  "home_win"
    t.decimal  "away_win"
    t.decimal  "draw"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bookmakers", ["odd_type_id"], name: "index_bookmakers_on_odd_type_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "winnings"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "home"
    t.string   "away"
    t.string   "type"
    t.string   "bet"
    t.string   "match_id"
    t.integer  "betslip_id"
    t.integer  "stake_cents", default: 0, null: false
  end

  add_index "games", ["betslip_id"], name: "index_games_on_betslip_id", using: :btree

  create_table "handicapes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.string   "handicape_type"
    t.integer  "bookmaker_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string   "static_id"
    t.string   "alternate_id"
    t.datetime "play_date"
    t.string   "hometeam"
    t.string   "awayteam"
    t.integer  "league_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "odd_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "odd_types", ["match_id"], name: "index_odd_types_on_match_id", using: :btree

  create_table "over_under_total_values", force: :cascade do |t|
    t.integer  "bookmaker_id"
    t.string   "name"
    t.decimal  "under"
    t.decimal  "over"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "ht_home_goal"
    t.integer  "ht_away_goal"
    t.integer  "ft_home_goal"
    t.integer  "ft_away_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "bookmakers", "odd_types"
  add_foreign_key "odd_types", "matches"
end
