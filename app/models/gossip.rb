class Gossip < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :likes, dependent: :destroy

  validates :title, length: { in: 6..20 }

  validates :content, presence: true

  def liked_by?(user)
    !like_by(user).nil?
  end

  def like_by(user)
    likes.find { |like| like.user_id == user&.id }
  end
end
