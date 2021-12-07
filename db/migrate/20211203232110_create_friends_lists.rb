class CreateFriendsLists < ActiveRecord::Migration[6.1]
  def change
    create_table :friendslists do |t|
      t.integer :user_a_id
      t.integer :user_b_id
    end
  end
end
