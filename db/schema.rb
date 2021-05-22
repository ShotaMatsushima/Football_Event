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

ActiveRecord::Schema.define(version: 2021_05_22_023203) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", null: false
    t.string "address", default: "", null: false
    t.datetime "start_at", null: false
    t.string "event_team", default: "", null: false
    t.integer "capacity", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_at", null: false
    t.string "image"
    t.float "latitude"
    t.float "longitude"
    t.text "title", null: false
    t.index ["user_id", "created_at"], name: "index_events_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_likes_on_event_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "visiter_id", null: false
    t.integer "visited_id", null: false
    t.integer "event_id"
    t.integer "comment_id"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "participation_id"
    t.integer "action", null: false
    t.index ["comment_id"], name: "index_notifications_on_comment_id"
    t.index ["event_id"], name: "index_notifications_on_event_id"
    t.index ["participation_id"], name: "index_notifications_on_participation_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visiter_id"], name: "index_notifications_on_visiter_id"
  end

  create_table "participations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "following_id", null: false
    t.integer "follower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "favorite_team", default: "", null: false
    t.string "user_address", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "users"
  add_foreign_key "likes", "events"
  add_foreign_key "likes", "users"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
end
