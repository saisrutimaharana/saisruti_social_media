class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video
  has_many :comments, dependent: :destroy
  has_many :likes
  def liked_by?(user)
    likes.where(user: user).exists?
  end
end
