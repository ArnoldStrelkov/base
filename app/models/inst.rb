class Inst < ActiveRecord::Base
  
  mount_uploader :inst , InstUploader
  belongs_to :user
  
end
