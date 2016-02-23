class InstController < ApplicationController
   before_action :menu
   
   layout 'sochi'
   
  def index
      
    @all = Inst.all.order(id: :desc).limit(30)
    #@inst = true
    #@new_inst = Inst.new
    @s_choise_href  = '/allusersinst'
    @s_choise_text = 'все пользователи'
    @s_menu = [1, 0, 2]
    
  end
  
  def feedinst
    
    if @current_user
    ids = @current_user.followed_user_ids
    else
      if User.find(@admin)
    ids = User.find(@admin).followed_user_ids 
      else
      ids = [1]
      end
    end
    #@all = Post.where(user_id: ids).order(id: :desc).includes(:user ).limit(10)
    @all = Inst.where(user_id: ids).order(id: :desc).limit(30)
      
   
    #@inst = true
    @s_choise_href  = '/feedusersinst'
    @s_choise_text = 'читаемые пользователи'
    @s_menu = [0, 1, 2]
    
    render :index
  end
   
   def allusersinst
      
    
    #@inst = true
    @instuser = 'instuser/'
    @s_choise_href  = '/inst'
    @s_choise_text = 'вся лента'
    @s_menu = [1, 0, 2]
    
    @users = User.all.limit(10)
    render 'main/feedusers'
    
   end
   
   def feedusersinst
    @instuser = 'instuser/'
    
    @s_choise_href  = '/feedinst'
    @s_choise_text = 'Читаемая лента'
    @s_menu = [0, 1, 2]
    @menu_read_users = true
    if @current_user
    @users = @current_user.followed_users.limit(10)
    else
    @users = User.find(@admin).followed_users.limit(10)
    end  
    render 'main/feedusers'
    
   end
   
   
   
   def instfollowers
   @instuser = 'instuser/'
   
    @s_choise_href  = "/instuser/#{@current_user.id unless @current_user.nil?}"
    @s_choise_text = 'моя лента'
    @s_menu = [2, 0, 1]
    @users = @current_user.following_users.limit(10)
    render 'main/feedusers'
   
   end
   
   
   
   
    def instuser
        
        
    
    @all = Inst.where("user_id = ?", params[:id]).order(id: :desc).limit(30)
    
    if @inst
      @s_choise_href  = '/instfollowers'
      @s_choise_text = 'мои подписчики'
      
    end
    @s_menu = [2, 0, 1]
       
       render :index
    end
   
   
   
  def create
      
   pic = params[:inst]
  
   
   #render text: pic.to_s
   
   #@current_user.insts.create(resume_params)
   i = Inst.new
   i.inst = pic
   i.user_id = @current_user.id
i.save
  #  Inst.create(inst: @pic,  user_id: @current_user.id)
    redirect_to "/instuser/#{@current_user.id}"
    
  end
    
  def menu
    @s_menu_href = ["\\feedinst", '\\inst', "\\instuser\\#{@current_user.id unless @current_user.nil?}"]
    @s_menu_text = ['читаемая лента', 'вся лента', 'моя лента']
    @yellow = ['', '', 'yellow', '']
    
    @inst = true if @current_user #and (@current_user.id.to_s == params[:id].to_s)
  end
  
    private
  def resume_params
    params.permit(:inst)
  end
    
  
end