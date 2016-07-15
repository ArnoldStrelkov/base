class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :login #, except: :provider
  
    def provider
      req = request.env['omniauth.auth']
      
      #render json: req and return
      
      provider = req.provider.to_s
      uid = req.uid.to_s
      name = req.info.name
      avatar = req.info.image
      
      #render text: provider + uid + name + avatar  and return
      
      
      
      @current_user = User.where("provider = ? AND uid = ?", provider, uid).first
      
      if @current_user
          
      else
        @current_user = User.new
        @current_user.provider = provider
        @current_user.uid = uid
        @current_user.name = name
        (@current_user.remote_avatar_url = avatar.gsub('http','https') + '?type=large') if provider == 'facebook'
        (@current_user.remote_avatar_url = avatar) if provider == 'vkontakte'

        @current_user.save!
        
        
        newfeed
        
        #render json: request.env['omniauth.auth'] and return
         
      end
      
    @token = User.new_remember_token
  
    obj = Token.new
    obj.email_tmp = 'aa@aa.aa'
    obj.token = User.encrypt(@token)
    obj.user_id = @current_user.id
    obj.save
      cookies.permanent[:id] = obj.id
      cookies.permanent[:token] = @token
    
      
    redirect_to :root 
    end
    
    
    def login
      @admin = 15
      @current_user = nil
      $var1 = User.find(@admin)
      
      unless cookies[:id].nil?
      obj = Token.find_by(id: cookies[:id])
      
         if obj.nil?
           cookies.delete(:token)
           cookies.delete(:id)
      
            redirect_to :root and return
         end
      
      
        if User.encrypt(cookies[:token]) == obj.token
          @current_user = User.find_by(id: obj.user_id)
          $var1  = @current_user unless @current_user.nil?
        end  
      
      end
    end
    
    def enter
      @token = User.new_remember_token
      
      obj = Token.new
      obj.email_tmp = params[:email]
      obj.token = User.encrypt(@token)
      if obj.save
          cookies.permanent[:id] = obj.id
      else
        render text: 'error' and return
      end
      
     # UserMailer.welcome_email(params[:email], @token ).deliver_later
     @email_url = 'http://' + obj.email_tmp.split('@')[1].to_s
    render :enter,  layout: false
    end  
     
      
    def  login_by_email
      
      obj = Token.find_by(id: cookies[:id])
      
      if obj.nil?
        
        redirect_to '/error' and return
        #render 'main/error' and return
      end
  
      
      
      if User.encrypt(params[:token]) == obj.token
        
        @current_user = User.find_by(email: obj.email_tmp)
        if @current_user
          
          
          
        else
          @current_user = User.new
          @current_user.email = obj.email_tmp
          @current_user.name = obj.email_tmp.split('@')[0].to_s
          
          File.open('/home/ubuntu/workspace/public/user.png') do |f|
          #File.open('/home/deploy/base/public/user.png') do |f|  
          #123
           @current_user.avatar = f
          end
          
          @current_user.save
          
          newfeed
          
          @new_user = true
          @title = 'Завершение регистрации'
        end
         
        #obj.email_tmp = nil
        obj.user_id = @current_user.id
        obj.save
        cookies.permanent[:token] = params[:token]
        
       
        
        
        
      else  
       @current_user = nil 
       
       #render 'main/error' and return
        redirect_to '/error' and return
      end 
      
      @new_user ? (render 'main/settings' and return) : (redirect_to :root)
      
      
      
    end 
    
      
     
    def exit
    
    Token.find_by(id: cookies[:id]).destroy  
    cookies.delete(:token)
    cookies.delete(:id)
    @current_user = nil
     redirect_to :root
    end
    
    def test
    
    #render text: params[:product] 
    render :enter,  layout: false
    end
    
    def error
    
    @title = 'Ошибка '
    render 'main/error'
    
    end
    
    def newfeed 
    feed = User.find(@admin).followed_user_ids
    feed.each {|id| Feed.create(followed_id: id, follower_id: @current_user.id) }
    end
  
    def newtoken 
      
    end
  
end
