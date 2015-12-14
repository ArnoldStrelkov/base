class Token < ActiveRecord::Base
   
   validates_format_of :email_tmp, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    #validates :email_tmp, presence: true
    before_save { (self.email_tmp = self.email_tmp.downcase) unless self.email_tmp.nil?}
end