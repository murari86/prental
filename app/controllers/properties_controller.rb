class PropertiesController < ApplicationController
  def new
    if not session[:user_id]
      redirect_to login_users_path
      return
    end
    @property = Property.new
  end

  def create
    if session[:user_id]
      @user = User.find(session[:user_id])
      @property = @user.properties.create(params[:property].permit(:title, :avatar, :property_type, :category, :construct_date, :land_area, :covered_area, :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode))
      if @property.save
         redirect_to @property
      else
       render :new
      end      
    else
      redirect_to login_users_path
    end  
  end
   
  def show
    puts "#{@property}"
    @property = Property.find(params[:id])  
  end
  
  def edit
    if not session[:user_id]
      redirect_to login_users_path
    else  
     @property = Property.find(params[:id])
    end   
  end
  
  def update
    @property = Property.find(params[:id])
    if session[:user_id]
      @property.update(params[:property].permit(:title, :property_type, :category, :image, :construct_date, :land_area, :covered_area, :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode))
      redirect_to property_path
    else
      redirect_to login_users_path 
    end  
  end

  def index
     @property = Property.search(params[:title])
    #if !params[:title].blank?
     # @property = Property.where("properties.title LIKE ?" , "%#{params[:title]}%")
  #  else current_user
   #   @property = current_user.properties
   # end
  end
  
    
  def list
    if session[:user_id]
      @property =  Property.where("user_id = ?", session[:user_id])
    else 
      @property = Property.all
    end
  end
  
end  
  

