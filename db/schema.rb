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

ActiveRecord::Schema.define(version: 2018_03_04_031049) do

  create_table "playlist_items", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "duration", default: 10, null: false
    t.integer "position", null: false
    t.integer "poster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "destroyed_at"
    t.index ["playlist_id"], name: "index_playlist_items_on_playlist_id"
    t.index ["poster_id"], name: "index_playlist_items_on_poster_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posters", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_parameterized", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
