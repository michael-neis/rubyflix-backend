class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :mpa_rating
      t.string :movie_img
      t.references :director
    end
  end
end
