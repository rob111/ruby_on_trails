class ChangeStartLantitudeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :trails, :start_latitutde, :start_latitude
  end

end
