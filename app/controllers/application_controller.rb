class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception 
  def after_sign_in_path_for(user)
       '/articles/new'
   end
   #def after_sign_out_path_for(user)
       #'/articles/new'
   #end
end