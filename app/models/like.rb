class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  validate :no_duplicate

  private

  def no_duplicate
    return unless user && gossip

    errors.add(:user_id, 'Already liked') if gossip.liked_by?(user)
  end
end
