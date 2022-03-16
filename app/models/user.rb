class User < ApplicationRecord
  include Clearance::User
  has_many :shouts, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  has_many :followed_user_relationships, 
  foreign_key: :follower_id, 
  class_name: "FollowingRelationship",
  dependent: :destroy

  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships, 
  foreign_key: :followed_user_id,
  class_name: "FollowingRelationship",
  dependent: :destroy

  has_many :followers, through: :follower_relationships
  
  def like(shout)
    liked_shouts << shout
  end
  def unlike(shout)
    liked_shouts.destroy(shout)
  end
  def liked?(shout)
    liked_shouts.include?(shout)
  end

  def follow(user)
    self.followed_users << user
  end
  
  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def to_param
   username
  end
end
