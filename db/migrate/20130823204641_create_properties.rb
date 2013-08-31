class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
     t.string :property_type
     t.string :property_age
     t.string :land_area
     t.string :covered_area
     t.string :bedroom
     t.string :bathroom
     t.string :society
     t.string :city
     t.string :state
     t.string :country
     t.integer :rental_prize
     t.string :pincode

      t.timestamps
    end
  end
end
