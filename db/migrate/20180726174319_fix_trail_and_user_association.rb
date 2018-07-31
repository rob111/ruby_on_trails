class FixTrailAndUserAssociation < ActiveRecord::Migration[5.2]
  def change
    change_table :trails do |t|
      t.remove_references :user
    end
    add_column :trails, :created_by, :integer
  end
end
