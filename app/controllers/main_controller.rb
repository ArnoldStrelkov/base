class MainController < ApplicationController
  
  layout 'sochi'
  
  def feed
    @menu_read = true
    @title = 'Читаемые блоги'
    
    @s_choise_href  = '/feedusers'
    @s_choise_text = 'Читаемые пользователи'
    @s_menu = [0, 1, 2]
    
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
    @all = Post.where(user_id: ids).order(id: :desc).includes(:user => [:following_i_ams] ).limit(10)
  end
  
  def feed_add
    page = params[:page]
    @menu_read = true
    @title = 'Читаемые блоги'
    if @current_user
    ids = @current_user.followed_user_ids
    else
    ids = User.find(@admin).followed_user_ids  
    end
    #@all = Post.where(user_id: ids).order(id: :desc).offset(10*page.to_i).limit(10)
    @all = Post.where(user_id: ids).order(id: :desc).offset(10*page.to_i).includes(:user => [:following_i_ams] ).limit(10)
    render :feed, layout: false
  end
  
  def all
    
    @title = 'Все блоги'
    @menu_all = true
    @s_menu = [1, 0, 2]
    
    @s_choise_href  = '/allusers'
    @s_choise_text = 'все пользователи'
    
    @all = Post.all.order(id: :desc).includes(:user => [:following_i_ams] ).limit(10)
    render :feed
  end
  
  def all_add
    page = params[:page]
    @title = 'Все блоги'
    @menu_all = true
    @all = Post.all.order(id: :desc).offset(10*page.to_i).includes(:user => [:following_i_ams] ).limit(10)
    render :feed, layout: false
  end
  
  
  
  
  
  def feedusers
    
    @title = 'Читаемые блогеры'
    @s_choise_href  = '/'
    @s_choise_text = 'Читаемая лента'
    @s_menu = [0, 1, 2]
    @menu_read_users = true
    if @current_user
    @users = @current_user.followed_users.limit(10)
    else
    @users = User.find(@admin).followed_users.limit(10)
    end
    
  end
  
  def feedusers_add
     page = params[:page]
    @title = 'Читаемые блогеры'
    @menu_read_users = true
    if @current_user
    @users = @current_user.followed_users.offset(10*page.to_i).limit(10)
    else
    @users = User.find(@admin).followed_users.offset(10*page.to_i).limit(10) 
    end
    render :feedusers, layout: false
  end
  
  
  
  
  def allusers
    
    @menu_all_users = true
    @s_choise_href  = '/all'
    @s_choise_text = 'вся лента'
     @s_menu = [1, 0, 2]
    @title = 'Все блогеры'
    @users = User.all.limit(10)
    render :feedusers
    
  end
  
  def allusers_add
    
    page = params[:page]
    @menu_all_users = true
    @title = 'Все блогеры'
    @users = User.all.offset(10*page.to_i).limit(10)
    render :feedusers, layout: false
    
  end
  
  
  
  def user
    
    @title = User.find(params[:id]).name
    @add = false 
    @all = Post.where("user_id = ?", params[:id]).order(id: :desc).limit(10)
    @add = true if @current_user and (@current_user.id.to_s == params[:id].to_s)
    if @add
      @s_choise_href  = '/'
      @s_choise_text = 'мои подписчики'
      
    end
    @s_menu = [2, 0, 1]
    
    render :feed
    
  end
  
  def user_add
    page = params[:page]
    @title = User.find(params[:id]).name
    @add = false 
    @all = Post.where("user_id = ?", params[:id]).order(id: :desc).offset(10*page.to_i).limit(10)
    @add = true if @current_user and (@current_user.id.to_s == params[:id].to_s)
    render :feed, layout: false
    
  end
  
  
  
  def settings
   
  end
  
  def updatesettings
   
    name = params[:name] 
    avatar = params[:avatar]
    @current_user.update(name: name, avatar: avatar) 
    redirect_to :root
    
  end
  
  def init
  
  unless User.find_by_id(1)  
  u = User.new
  u.name = 'admin'
  u.email = 'wikiuspeha@gmail.com'
  u.save
  end
  
  redirect_to :root
   
  end
  
  def about
    @title = 'О проекте'
  end
  
  def tusa
    @title = 'Стартап тусовка'
  end
  
  def ads
    @title = 'Обьявления'
    @menu_ads = true
    @all = Ad.all.order(id: :desc)
    
  end
  
  def myads
    @title = 'Мои обьявления'
    @menu_my_ads = true
    @all = Ad.where(user_id: @current_user.id).order(id: :desc)
    render :ads
  end
  
  
  
end

