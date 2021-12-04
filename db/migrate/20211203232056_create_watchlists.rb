class CreateWatchlists < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlists do |t|
      t.references :user
      t.references :movie
    end
  end
end
