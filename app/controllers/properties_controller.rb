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
      @property = @user.properties.create(params[:property].permit(:title, :property_type, :category, :image, :construct_date, :land_area, :covered_area, :bedrooms, :bathrooms, :street, :locality, :city, :state, :country, :rental_prize, :selling_prize, :pincode))
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
    @property = Property.find(params[:id])  
  end
  
  def edit
    if session[:user_id]
     @property = Property.find(params[:id])
    else
      redirect_to login_users_path
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
    if !params[:title].blank?
      @properties = Property.where("properties.title LIKE ?" , "%#{params[:title]}%")
    elsif current_user
      @properties = current_user.properties
    else
      @properties = Property.all 
    end
  end
  
  def search
    if not session[:user_id]
      redirect_to login_users_path
    end
  end
  
  def uploadFile
    post = Property.save(params[:image])
    render :text => "File has been uploaded successfully"
  end
  
  def list
    if not session[:user_id]
      redirect_to login_users_path
    end
    @properties =  Property.where("user_id = ?", session[:user_id])
    
  end
  
end
