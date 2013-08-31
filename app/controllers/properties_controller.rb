class PropertiesController < ApplicationController
  def new
   @propertie = Property.new
  end

  def create
    @propertie = Property.create(params[:@properties].permit(:title, :user_id, :construct_date, :land_area, :covered_area, :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode))

    if @propertie.save
      redirect_to @propertie
    end  
  end
  
  def show
    @propertie = Property.find(params[:id])
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def update
    @property = Property.find(params[:id])
    if @property.update(params[:property].permit(:construct_date, :land_area, :covered_area, :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode))
       redirect_to property_path
       
    end  
  end

  def index
    unless params[:title].blank?
      @properties = Property.where("properties.title LIKE ?" , "%#{params[:title]}%")
    else
      @properties = current_user.properties
    end
  end
  
  def search
    if not session[:user_id]
      redirect_to login_users_path
    end
  end
  
  
end
