class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy

  has_many :likes, dependent: :destroy

  validates :password, presence: true, length: { minimum: 6 }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'email address please' }

  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
