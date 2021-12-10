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

ActiveRecord::Schema.define(version: 2021_12_07_000804) do

  create_table "director_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "director_id"
    t.integer "ranking"
    t.index ["director_id"], name: "index_director_favorites_on_director_id"
    t.index ["user_id"], name: "index_director_favorites_on_user_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "oscars"
  end

  create_table "friendslists", force: :cascade do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
  end

  create_table "movie_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.integer "ranking"
    t.index ["movie_id"], name: "index_movie_favorites_on_movie_id"
    t.index ["user_id"], name: "index_movie_favorites_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.string "mpa_rating"
    t.string "movie_img"
    t.integer "director_id"
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.integer "star_rating"
    t.string "comment"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "suggesteds", force: :cascade do |t|
    t.integer "user1"
    t.integer "user2"
    t.integer "movie_id"
    t.string "comment"
    t.index ["movie_id"], name: "index_suggesteds_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.index ["movie_id"], name: "index_watchlists_on_movie_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

end
