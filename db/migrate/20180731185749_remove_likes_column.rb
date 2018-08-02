class RemoveLikesColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :reviews, :like
  end
  def down
    add_column :reviews, :like, :integer
  end
end
