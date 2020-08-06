class City < ApplicationRecord
  has_many :users, dependent: :destroy # Yes, if city blows up, users from that city die! Hahaha 
  has_many :gossips, through: :users
end
