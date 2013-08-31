class RemoveColumnToProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :property_type, :string
    remove_column :properties, :property_age, :string
  end
end
