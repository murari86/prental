class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    unless session[:user_id].blank?
      @current_user = User.where(:id => session[:user_id]).first 
    end
  end
end