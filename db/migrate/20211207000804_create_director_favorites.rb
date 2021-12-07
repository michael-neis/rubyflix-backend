class CreateDirectorFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :director_favorites do |t|
      t.references :user
      t.references :director
      t.integer :ranking
    end
  end
end
