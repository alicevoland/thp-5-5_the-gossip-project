class AddGossipRefToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :gossip, foreign_key: true
  end
end
