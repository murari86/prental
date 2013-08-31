class RemoveColumnProperty < ActiveRecord::Migration
  def change
  remove_column :properties, :status, :string
  remove_column :properties, :society, :string
  end
end
