class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    has_many :posts
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_many :friendships, foreign_key: 'follower_id', dependent: :destroy
    has_many :followed_users, through: :friendships, source: :followed
    has_many :followers, class_name: 'Friendship', foreign_key: 'friend_id'

    
    def follow(other_user)
        followed_users << other_user
    end

    def unfollow(other_user)
        followed_users.delete(other_user)
    end

    def following?(other_user)
        followed_users.include?(other_user)
    end
end
