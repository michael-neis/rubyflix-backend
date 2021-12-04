class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :movie
      t.references :director
      t.integer :ranking
    end
  end
end
