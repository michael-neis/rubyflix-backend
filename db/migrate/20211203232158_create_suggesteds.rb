class CreateSuggesteds < ActiveRecord::Migration[6.1]
  def change
    create_table :suggesteds do |t|
      t.integer :user1
      t.integer :user2
      t.references :movie
      t.string :comment
    end
  end
end
