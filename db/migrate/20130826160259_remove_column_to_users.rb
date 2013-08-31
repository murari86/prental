class RemoveColumnToUsers < ActiveRecord::Migration
  def change
   remove_column :users, :password_confirmation, :string
   remove_column :users, :age, :integer
   remove_column :users, :mobile_no, :integer
   remove_column :users, :locality, :string
   remove_column :users, :city, :string
    
  end
end
