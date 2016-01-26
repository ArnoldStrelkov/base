class User < ActiveRecord::Base
     mount_uploader :avatar , AvatarUploader
    
    
    has_many :ads, dependent: :destroy
    has_many :posts, dependent: :destroy
    #has_many :test, foreign_key: :user_id, class_name: "Post"
    has_many :savedposts
    has_many :sv, through: :savedposts, source: :post
    
    has_many :feeds, foreign_key: "follower_id", class_name:  "Feed", dependent: :destroy
    has_many :followed_users, through: :feeds, source: :followed
    
    has_many :reverse_i_ams, -> { i_only }, foreign_key: "followed_id", class_name:  "Feed"
    has_many :following_i_ams,  through: :reverse_i_ams, source: :follower
    
    
  
  def following?(other_user)
    feeds.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    feeds.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    feeds.find_by(followed_id: other_user.id).destroy!
  end
    
    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

      def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
      end
  

private

  def create_remember_token
      self.token = User.encrypt(User.new_remember_token)
  end
    
     
end