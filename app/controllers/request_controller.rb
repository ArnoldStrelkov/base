class RequestController < ApplicationController
  
  def index
     @req_index  = true
     @users = User.all.order(id: :desc).limit(200)
     @grid = true
     
  end  
  
  def add
     
     render nothing: true
     
  end  
  
  def req
    @req_req  = true
    @reqs = Req.all.order(id: :desc)
     
  end 
  
  def create
    @current_user.reqs.create(params.permit(:text))
    redirect_to :req
   
  
  end
  
end
