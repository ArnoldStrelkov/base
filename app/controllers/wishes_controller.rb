class WishesController < ApplicationController
  
  def index
     @wishes = Wish.all.order(id: :desc)
     @grid = true
  end  
  
  def add
     @wishes = Wish.all.order(id: :desc)
     render 'index', layout: false
  end  
  
  def create
   
   body = params[:body]
   w = Wish.new
   w.body = body
   w.user_id = @current_user.id
   w.save
 
  redirect_to :root
    
    
    
  end
  
  
end
