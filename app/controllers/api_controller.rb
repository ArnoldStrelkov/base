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

def edit
  id = params[:id]
  @post = Post.find(id)
  render  'main/edit', layout: false
  
end

def editpost
  id = params[:id]
  post = Post.find(id)
  
  if post.user.id = @current_user.id
  post.title = params[:title]
  post.body = params[:body]
  post.save
  end
  
  @all = []
  @all = @all << post
  
  
  render  'main/feed', layout: false
  
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

def new_tusa
    
  @title = 'Ок'
  @tusa = true
  name = params[:name]
  tel = params[:tel] 
    
  Tusa.create(name: name, tel: tel)
  
  
  render  'main/tusa'
end

def createad
  
  title = params[:title]
    body = params[:body] 
   
    res = Ad.create(body: body, title: title, user_id: @current_user.id)
    @all = []
    @all = @all << res
   #render text: res.body
    render  'main/ads', layout: false
  
end

def ads_delete
  id = params[:id]
  obj = Ad.find(id)
  obj.destroy if obj.user.id == @current_user.id
  
  render text: '1'
end




end
    