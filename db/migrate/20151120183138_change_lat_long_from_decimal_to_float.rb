class ChangeLatLongFromDecimalToFloat < ActiveRecord::Migration
  def change
    change_column :pseudocrumbs, :lat, :float
    change_column :pseudocrumbs, :long, :float
  end
end
