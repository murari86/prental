class Property < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :construct_date, presence: true
  validates :pincode, presence: true, length: { minimum: 6 }
  attr_accessible :user_id, :construct_date, :land_area, :covered_area, 
  :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode, :title, :property_type, :category, :image, :commenter, :body
  def self.save(image)
    name = image['datafile'].original_filename
    directory = 'public/data'
    # create the file path
    path = File.join(directory,name)
    # write the file
    File.open(path, "wp") { |f| f.write(upload['datafile'].read)}
  end
end
