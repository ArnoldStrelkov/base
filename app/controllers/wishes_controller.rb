class WishesController < ApplicationController
  
  def index
     @wishes = Wish.all.order(id: :desc).limit(10)
     @grid = true
  end  
  
  def add
    page = params[:page]
    
     @wishes = Wish.all.order(id: :desc).offset(10*page.to_i).limit(10)
     render 'index', layout: false
  end  
  
  def create
   
   body = params[:body]
   w = Wish.new
   w.body = body[0..1000]
   w.user_id = @current_user.id
   w.save
 
  redirect_to :root
    
    
    
  end
  
  
end
