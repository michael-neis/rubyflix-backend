class CreateFriendsLists < ActiveRecord::Migration[6.1]
  def change
    create_table :friendslists do |t|
      t.integer :user1
      t.integer :user2
    end
  end
end
