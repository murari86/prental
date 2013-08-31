class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_id
      t.string :password
      t.string :f_name
      t.string :l_name
      t.integer :age
      t.string :locality
      t.string :city
      t.integer :mobile_no
      t.integer :phone_no
      
      
      t.timestamps
    end
  end
end
 
