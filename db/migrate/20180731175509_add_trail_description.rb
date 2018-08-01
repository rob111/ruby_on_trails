class AddTrailDescription < ActiveRecord::Migration[5.2]
  def up
    add_column :trails, :description, :text
    add_column :trails, :ascent, :integer
    add_column :trails, :photo, :string
    add_column :trails, :low_elevation, :integer
    add_column :trails, :high_elevation, :integer
    change_column :trails, :street, :string, :null => true
    remove_column :trails, :elevation
  end

  def down
    remove_column :trails, :description
    remove_column :trails, :ascent
    remove_column :trails, :photo
    remove_column :trails, :low_elevation, :integer
    remove_column :trails, :high_elevation, :integer
    change_column :trails, :street, :string, :null => false
    add_column :trails, :elevation, :string
  end
end
