# frozen_string_literal: true
class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :sender, null: false, index: true, foreign_key: { to_table: :users }
      t.references :receiver, null: false, index: true, foreign_key: { to_table: :users }
      t.string :status, null: false
      t.timestamps
    end
    add_index :friendships, [:sender_id, :receiver_id], unique: true
  end
end
