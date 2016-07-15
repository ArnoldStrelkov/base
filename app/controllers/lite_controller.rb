class LiteController < ApplicationController
  layout 'lite_lay'
  
  def index
    
    
  end
  
  def add
    
    
    Lite.create(name: permit_params[:name], tel: permit_params[:tel], type: permit_params[:id])
    
    render text: permit_params[:name]
  end
  
  
  def permit_params
    params.permit(:id, :name, :tel)
    
  end
  
  
end
