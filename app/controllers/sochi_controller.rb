class SochiController < ApplicationController
  
  def index
    @menu_read = true
    @title = 'Читаемые блоги'
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
  render 'main/feed'
  end
  
  
end

