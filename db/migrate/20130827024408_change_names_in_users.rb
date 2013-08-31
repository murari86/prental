class ChangeNamesInUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :f_name, :first_name  
      t.rename :l_name, :last_name   
    end  
  end
end
