class AddTrailsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name, null: false, unique: true
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip
      t.string :start_latitude
      t.string :start_longitude
      t.string :length, null: false
      t.integer :difficulty
      t.string :elevation
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
