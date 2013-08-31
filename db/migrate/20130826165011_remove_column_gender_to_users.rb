class RemoveColumnGenderToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :email_id, :email
    remove_column :users, :gender, :string
  end
end
