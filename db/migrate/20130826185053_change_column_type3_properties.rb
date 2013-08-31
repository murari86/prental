class ChangeColumnType3Properties < ActiveRecord::Migration
  def up
    remove_column :properties, :bathrooms
    add_column :properties, :bathrooms, :integer  
    remove_column :properties, :bedrooms
    add_column :properties, :bedrooms, :integer
  end
 
  def down
    remove_column :properties, :bathrooms
    add_column :properties, :bathrooms, :string
    remove_column :properties, :bedrooms
    add_column :properties, :bedrooms, :string
  end
end
