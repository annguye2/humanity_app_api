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

ActiveRecord::Schema.define(version: 20170518004904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blackcards", force: :cascade do |t|
    t.string   "question"
    t.string   "rating"
    t.string   "category"
    t.integer  "pick"
    t.string   "player_won"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_dealt",   default: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.integer  "high_score"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "blackcard_id"
    t.integer  "whitecard_id"
    t.integer  "score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["blackcard_id"], name: "index_scores_on_blackcard_id", using: :btree
    t.index ["whitecard_id"], name: "index_scores_on_whitecard_id", using: :btree
  end

  create_table "whitecards", force: :cascade do |t|
    t.string   "answer"
    t.string   "rating"
    t.string   "category"
    t.string   "player"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_discarded", default: false
  end

  add_foreign_key "scores", "blackcards"
  add_foreign_key "scores", "whitecards"
end
