class InstController < ApplicationController
   layout 'sochi'
   
  def index
      
    @all = Inst.all
    @inst = true
    @new_inst = Inst.new
    
    
  end
   
  def create
      
   #pic = params[:inst]
  
   
   #render text: pic.to_s
   
   @current_user.insts.create(resume_params)
   #i = Inst.new
   #i.inst = pic
   #i.user_id = @current_user.id
   #i.save
  #  Inst.create(inst: @pic,  user_id: @current_user.id)
    redirect_to inst_index_path
    
  end
    
    
    private
  def resume_params
    params.permit(:inst)
  end
    
end