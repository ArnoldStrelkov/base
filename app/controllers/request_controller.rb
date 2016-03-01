class RequestController < ApplicationController
  
  def index
     
     @users = User.all.order(id: :desc).limit(200)
     @grid = true
     
  end  
  
  def add
     
     render nothing: true
     
  end  
  
  
  
  
end
