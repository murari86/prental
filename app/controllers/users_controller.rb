class UsersController < ApplicationController
  def new
    if session[:user_id]
      redirect_to search_properties_path(session[:user_id])
      return
    end
    @user = User.new
  end

  def signup
    @user = User.create(params[:user].permit(:email, :password, :role, :first_name, :last_name, :phone_no, :password_confirmation))
    puts "-------------------------#{params}"
    if @user.save
      redirect_to @user
    else
      render 'new'
    end      
  end
   
  def index
    @users = User.all
  end
  
  def show
    if session[:user_id]
      @user = User.find(session[:user_id]) 
     else
      @user = User.find(params[:id])
    end
  end 
   
  
   
  def edit
    if session[:user_id]
      @user = User.find(session[:user_id]) 
     else
      redirect_to login_users_path
    end
  end

  def update
    if session[:user_id]
      @user = User.find(session[:user_id]) 
      @user.update(params[:user].permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_no))
        redirect_to @user
    else
      render :edit
    end
  end  
  
  def login
    if request.post?
      @user = User.authenticate(params[:user][:email], params[:user][:password])
      if @user
        #Authentication success
        session[:user_id] = @user
        redirect_to search_properties_path(session[:user_id])
      else
        #Authentication failled
        @error = "Email/Password not matched."
      end
    else
      if session[:user_id]
        redirect_to search_properties_path(session[:user_id])
        return
      end
      @user = User.new
    end
  end  
  
  
  def logout
   session[:user_id] = nil
   redirect_to login_users_path
  end

end
