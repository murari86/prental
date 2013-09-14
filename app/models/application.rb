class Application < ActiveRecord::Base
   belongs_to :property
   attr_accessible :email, :status, :phone_no, :start_date, :end_date
end
