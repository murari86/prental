class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create(params[:user].permit(:email, :password, :first_name, :last_name, :phone_no))
      if @user.save!
        redirect_to @user
      end
  end
   
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id]) 
  end
   
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user].permit(:email, :password, :first_name, :last_name, :phone_no))
      redirect_to @user
    else
      render :edit
    end
  end  
   
  def login
  end
  
  def authenticate_user
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    if @user
      #Authentication success
      puts "#{@user}"
      puts "muarrrtrtra"
      session[:user_id] = @user
      puts "#{session[:user_id]}"
      redirect_to search_properties_path(session[:user_id])
    else
      #Authentication failled
      redirect_to login_users_path
    end
    return
  end  
  
  
  def logout
   session[:user_id] = nil
  end

end
