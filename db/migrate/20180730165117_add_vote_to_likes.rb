class AddVoteToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :vote, :string, default: :null
  end
end
