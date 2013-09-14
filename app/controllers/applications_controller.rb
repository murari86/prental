class ApplicationsController < ApplicationController
  def new
    @app = Application.new
  end
 
  def create
    if session[:user_id] 
      @property = Property.find(params[:property_id])
      @user_app = @property.applications.create(params[:app].permit(:email, :start_date, :end_date, :status, :phone_no))
      if @user_app.save
       render 'properties/show'
      end 
    else
      redirect_to login_users_path
    end
  end
  def index
     @app = Application.all
  end
  
end
