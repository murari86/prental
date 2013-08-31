class RemovePhoneNoToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :phone_no, :integer
  end
end
