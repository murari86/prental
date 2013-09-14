class CommentsController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
     puts "#{@property}lllllllllllllllllllll"
    @comment = @property.comments.create(params[:comment])
    redirect_to property_path(@property)
  end
end
