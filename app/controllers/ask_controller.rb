class AskController < ApplicationController
  before_action :menu
  layout 'sochi'
  
  
  def ask_feed
    
    @s_choise_href  = '/askfeedusers'
    @s_choise_text = 'Читаемые пользователи'
    @s_menu = [0, 1, 2]
   
    @ask = Ask.where(target_id: ids).where.not(answer: nil).order(id: :desc).limit(20)
  
  end
  
  def ask_feed_users
   
    if @current_user
    @users = @current_user.followed_users.limit(10)
    else
    @users = User.find(@admin).followed_users.limit(10)
    end  
    
    @s_choise_href  = '/askfeed'
    @s_choise_text = 'Читаемые вопросы'
    @s_menu = [0, 1, 2]
  
  
  end
  
  def ask_all_users
   
    
    @users = User.all.limit(20)
    
    
    @s_choise_href  = '/allask'
    @s_choise_text = 'все вопросы'
    @s_menu = [1, 0, 2]
  
  render 'ask_feed_users'
  end
  
  
  
  def new_ask_form
   
    @user = User.find(params[:id])
  
  render layout: false
  end
  
  def new_ask
   
  ask = Ask.new
  ask.user_id = @current_user.id
  ask.target_id = params[:id]
  ask.body = params[:body]
  ask.save
  
  @users = User.find(params[:id])
  @users = [] << @users
  @flash = 'вопрос отправлен'
  render 'ask_feed_users', layout: false
  end
  
  def my_new_ask
    
    @ask = Ask.where(target_id: @current_user.id, answer: nil)
    @s_choise_href  = '/'
    @s_choise_text = 'мои подписчики'
    @s_menu = [2, 0, 1]
    
  end
  
  def my_new_answer
    
    ask = Ask.find(params[:id])
    ask.answer = params[:answer]
    ask.save
    
    redirect_to '/askfeed'
  end
  
  def all_ask
    
    @s_choise_href  = '/askallusers'
    @s_choise_text = 'все пользователи'
    @s_menu = [1, 0, 2]
    @ask = Ask.where.not(answer: nil).order(id: :desc).limit(20)
    
    render 'ask_feed'
  end
  
  def my_questions
    
    @s_choise_href  = '/'
    @s_choise_text = 'мои подписчики'
    @s_menu = [2, 0, 1]
  
  @ask = @current_user.asks.order(id: :desc).limit(20)
  
  render 'ask_feed'
  end
  
  
  
  
  
  
  
  
  
  def menu
    @s_menu_href = ["\\askfeed", '\\allask', "\\myquestions"]
    @s_menu_text = ['читаемые вопросы', 'все вопросы', 'мои вопросы']
    @yellow = ['yellow', '', '', '']
    @ask_button = true if @current_user and (@current_user.id.to_s == params[:id].to_s)
  @ask = true
  end
  
  
  
  
end