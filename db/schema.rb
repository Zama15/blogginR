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

ActiveRecord::Schema[7.1].define(version: 2024_02_08_174139) do
  create_table "categories", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title", limit: 50, null: false
    t.text "description", null: false
    t.boolean "eliminated", default: false, null: false
  end

  create_table "comments", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "body", size: :medium, null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: nil
    t.integer "post_id", unsigned: true
    t.bigint "author_id"
    t.boolean "checked", default: false, null: false
    t.boolean "edited", default: false, null: false
    t.integer "reported", default: 0, null: false
    t.boolean "eliminated", default: false, null: false
    t.index ["author_id"], name: "FK_comment_author"
    t.index ["post_id"], name: "FK_comment_post"
  end

  create_table "posts", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "thumbnail", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: nil
    t.bigint "author_id"
    t.boolean "checked", default: false, null: false
    t.boolean "eliminated", default: false, null: false
    t.index ["author_id"], name: "FK_blog_author"
  end

  create_table "posts_categories", primary_key: ["post_id", "category_id"], charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "post_id", null: false, unsigned: true
    t.integer "category_id", null: false, unsigned: true
    t.index ["category_id"], name: "FK_post_category_category"
  end

  create_table "preferences", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.string "theme", null: false
    t.string "color", null: false
    t.index ["user_id"], name: "FK_preferences_user"
  end

  create_table "user_v2", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "firstname", limit: 50
    t.string "lastname", limit: 50
    t.string "username", limit: 100, null: false
    t.string "email", limit: 100, null: false
    t.string "password_php"
    t.string "password_digest", null: false
    t.string "avatar"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.boolean "checked", default: false, null: false
    t.boolean "is_admin", default: false, null: false
    t.boolean "eliminated", default: false, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "username", limit: 50, null: false
    t.string "avatar"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts", name: "FK_comment_post", on_delete: :cascade
  add_foreign_key "comments", "users", column: "author_id", on_delete: :nullify
  add_foreign_key "posts", "users", column: "author_id", on_delete: :cascade
  add_foreign_key "posts_categories", "categories", name: "FK_post_category_category", on_delete: :cascade
  add_foreign_key "posts_categories", "posts", name: "FK_post_category_post", on_delete: :cascade
  add_foreign_key "preferences", "users", on_delete: :cascade
end
