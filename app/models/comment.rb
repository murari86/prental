class Comment < ActiveRecord::Base
  belongs_to :property
  attr_accessible :commenter, :body
end
