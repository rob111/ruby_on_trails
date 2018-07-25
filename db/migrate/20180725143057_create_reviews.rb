class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating, null: false

      t.belongs_to :trail
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
