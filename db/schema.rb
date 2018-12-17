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

ActiveRecord::Schema.define(version: 2018_10_17_211158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.string "title", null: false
    t.string "director", null: false
    t.string "year", null: false
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_path"
  end

  create_table "user_contents", force: :cascade do |t|
    t.bigint "content_id"
    t.bigint "user_id"
    t.boolean "favorite"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_user_contents_on_content_id"
    t.index ["user_id", "content_id"], name: "index_user_contents_on_user_id_and_content_id"
    t.index ["user_id"], name: "index_user_contents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.boolean "is_manager", default: false, null: false
    t.string "credit_card_number", null: false
    t.datetime "next_payment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
