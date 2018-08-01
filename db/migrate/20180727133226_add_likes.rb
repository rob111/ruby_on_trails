class AddLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false

      t.timestamps null: false
    end
  end
end
