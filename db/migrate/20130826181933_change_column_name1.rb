class ChangeColumnName1 < ActiveRecord::Migration
  def change
     change_table :properties do |t|
      t.rename :bedroom, :bedrooms  
      t.rename :bathroom, :bathrooms   
      
    end
   
    end
end
