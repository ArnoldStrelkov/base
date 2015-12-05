class Post < ActiveRecord::Base
   # require 'carrierwave/orm/activerecord'
    mount_uploader :foto , FotoUploader
    belongs_to :user
    #belongs_to :test, foreign_key: :user_id, class_name: "User"
    has_many :savedposts #, -> { order 'savedposts.id DESC' }
    #default_scope { order('id DESC') } 
end