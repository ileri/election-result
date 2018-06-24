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

ActiveRecord::Schema.define(version: 20180623223717) do

  create_table "alliances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "election_id"
    t.index ["election_id"], name: "index_alliances_on_election_id"
  end

  create_table "boxes", force: :cascade do |t|
    t.integer "no"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.integer "election_id"
    t.string "name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["election_id"], name: "index_candidates_on_election_id"
  end

  create_table "election_candidate_box_votes", force: :cascade do |t|
    t.integer "election_id"
    t.integer "candidate_id"
    t.integer "box_id"
    t.integer "vote_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_election_candidate_box_votes_on_box_id"
    t.index ["candidate_id"], name: "index_election_candidate_box_votes_on_candidate_id"
    t.index ["election_id"], name: "index_election_candidate_box_votes_on_election_id"
  end

  create_table "election_party_box_votes", force: :cascade do |t|
    t.integer "election_id"
    t.integer "party_id"
    t.integer "box_id"
    t.integer "vote_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_election_party_box_votes_on_box_id"
    t.index ["election_id"], name: "index_election_party_box_votes_on_election_id"
    t.index ["party_id"], name: "index_election_party_box_votes_on_party_id"
  end

  create_table "election_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "option"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.boolean "active"
    t.boolean "publishable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "election_type_id"
    t.index ["election_type_id"], name: "index_elections_on_election_type_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.integer "alliance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
    t.integer "order"
    t.integer "election_id"
    t.index ["alliance_id"], name: "index_parties_on_alliance_id"
    t.index ["election_id"], name: "index_parties_on_election_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
