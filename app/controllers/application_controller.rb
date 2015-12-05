class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login
  
  
    
    
    def login
      @admin = 15
      @current_user = nil
      
      unless cookies[:id].nil?
      obj = Token.find_by(id: cookies[:id])
      
      if User.encrypt(cookies[:token]) == obj.token
        @current_user = User.find_by(id: obj.user_id)
      end  
      
      end
    end
    
    def enter
      @token = User.new_remember_token
      
      obj = Token.new
      obj.email_tmp = params[:email]
      obj.token = User.encrypt(@token)
      obj.save
      cookies.permanent[:id] = obj.id
    
    end  
     
      
    def  login_by_email
      
      obj = Token.find_by(id: cookies[:id])
      
      if User.encrypt(params[:token]) == obj.token
        
        @current_user = User.find_by(email: obj.email_tmp)
        if @current_user
          
          
          
        else
          @current_user = User.new
          @current_user.email = obj.email_tmp
          @current_user.name = obj.email_tmp
          @current_user.save
          
          
        end
         
        obj.email_tmp = nil
        obj.user_id = @current_user.id
        obj.save
        cookies.permanent[:token] = params[:token]
        
       
        
        
        
      else  
       @current_user = nil 
        
      end 
      
      
      redirect_to :root
      
      
      
    end 
    
      
     
    def exit
      
    cookies.delete(:token)
    cookies.delete(:id)
    @current_user = nil
     redirect_to :root
    end
    
    
    
    
    
  
  
end
