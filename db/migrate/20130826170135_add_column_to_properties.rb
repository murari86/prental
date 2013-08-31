class AddColumnToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :construct_date, :date
    add_column :properties, :locality, :string
    add_column :properties, :street, :string
    add_column :properties, :status, :string
    add_column :properties, :selling_prize, :float
    add_column :properties, :user_id, :integer
    add_column :properties, :type, :integer
    add_column :properties, :category, :integer
  end
end
