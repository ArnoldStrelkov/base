class ApiController < ApplicationController



def createpost
  
  title = params[:title]
    body = params[:body] 
    foto = params[:picture]
    video = params[:video]
    res = Post.create(body: body, title: title, foto: foto, video: video, user_id: @current_user.id)
    @all = []
    @all = @all << res
   #render text: res.body
    render  'main/feed', layout: false
  
end













def delete
  id = params[:id]
  obj = Post.find(id)
  obj.destroy if obj.user.id == @current_user.id
  
  render text: '1'
end

def get_edit
  id = params[:id]
  @post = Post.find(id)
  render  layout: false
  
end


def update
 
   text = params[:body]
   header = params[:header]
   picture = params[:picture]
   obj = Post.find(params[:id])
    obj.update(body: text, picture: picture, header: header) if obj.user.id == @current_user.id
    @all = []
    @all = @all << obj
   #render text: res.body
    render  'main', layout: false
    
  
end

def saved
   id = params[:id]
   u = Savedpost.find_by(post_id: id, user_id: @current_user.id)
   if  u.nil?
   Savedpost.create(post_id: id, user_id: @current_user.id)
   render text: 'добавили'
   else
   u.destroy
    render text: 'удалили'
   end  
    
end

def read
 
   id = params[:id]
   
   u = Feed.find_by(followed_id: id, follower_id: @current_user.id)
   if  u.nil?
   Feed.create(followed_id: id, follower_id: @current_user.id)
   render text: 'читаем'
   else
   u.destroy
    render text: 'не читаем'
   end  
   
    
end


def picture
   
  @current_user.update(avatar: params[:user][:avatar]) 
  @current_user.save(validate: false)
  render text: @current_user.avatar.url
end






end
    