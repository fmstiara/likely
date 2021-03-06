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

ActiveRecord::Schema.define(version: 2018_09_25_103713) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.text "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_details", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cart_details_on_product_id"
    t.index ["user_id"], name: "index_cart_details_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "user_id"
    t.string "non_member_id"
    t.string "title"
    t.text "body"
    t.boolean "reply_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "product_id"
    t.boolean "is_movie", default: false
    t.integer "disc_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_discs_on_product_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "non_members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shipment_status", default: 0
    t.boolean "cancel_request", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "label_id"
    t.integer "genre_id"
    t.string "name"
    t.text "image_id"
    t.integer "price"
    t.integer "stock", default: 0
    t.integer "product_type", default: 0
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_products_on_genre_id"
    t.index ["label_id"], name: "index_products_on_label_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.text "file"
    t.integer "recommend_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "track_relations", force: :cascade do |t|
    t.integer "disc_id"
    t.integer "song_id"
    t.integer "artist_id"
    t.integer "track_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_track_relations_on_artist_id"
    t.index ["disc_id"], name: "index_track_relations_on_disc_id"
    t.index ["song_id"], name: "index_track_relations_on_song_id"
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
    t.boolean "admin", default: false
    t.string "name", default: "", null: false
    t.string "name_kana", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "state", default: "", null: false
    t.string "city", default: "", null: false
    t.string "address", default: "", null: false
    t.string "tel", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
