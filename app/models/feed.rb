class Feed < ActiveRecord::Base
   
    belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  scope :i_only, -> {where(follower_id: 52)}
  
  
  # belongs_to :user, class_name: "User", foreign_key: "user_id"
   # belongs_to :feed, class_name: "User" 
end