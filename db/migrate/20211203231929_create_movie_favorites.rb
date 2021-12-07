class CreateMovieFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_favorites do |t|
      t.references :user
      t.references :movie
      t.integer :ranking
    end
  end
end
