class AddLikeColumnToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :like, :integer
  end
end
