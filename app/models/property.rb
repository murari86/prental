class Property < ActiveRecord::Base
  attr_accessible :user_id, :construct_date, :land_area, :covered_area, 
  :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode, :title
end
