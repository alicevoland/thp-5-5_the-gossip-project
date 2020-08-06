class Comment < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :content, presence: true

  def get_gossip
    if commentable_type == 'Gossip'
      commentable
    else 
      commentable.get_gossip
    end
  end
end
