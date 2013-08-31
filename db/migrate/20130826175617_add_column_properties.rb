class AddColumnProperties < ActiveRecord::Migration
  def change
   add_column :properties, :land_area, :float
   add_column :properties, :covered_area, :float
  end
end
