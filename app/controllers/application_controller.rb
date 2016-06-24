class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception_logged_in
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
    
 helper_method :current_user
 helper_method :user_logged_in?
    
 def current_user
   @c_user ||= User.find( session[:user_id]) if session[:user_id]
#     User.find( session [:user_id]) unless session[:user_id].blank?

 end

 def user_logged_in?
   current_user.present?
 end
    
 def authenticate_user
     unless user_logged_in?
         flash[:error] = "You shall not pass"
         redirect_to login_url
     end
 end
end