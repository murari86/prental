class AddUserIdToProperties < ActiveRecord::Migration
  def change
    change_table :properties do |t|
    t.references :user
    end
  end
end
