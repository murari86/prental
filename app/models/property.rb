class Property < ActiveRecord::Base
  belongs_to :user
  has_many :applications
  has_many :comments
  validates :title, presence: true
  validates :construct_date, presence: true
  validates :pincode, presence: true, length: { minimum: 6 }
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  attr_accessible :user_id, :construct_date, :land_area, :covered_area, 
  :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode, :title, :property_type, :category,
   :commenter, :body, :search
  
  def self.search(title)
    if title
      find(:all, :conditions => ['title LIKE ?', "%#{title}%"])
    else
      find(:all)
    end
  end
   
end
