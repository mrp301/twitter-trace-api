class User < ApplicationRecord
  has_many :tweets
  has_many :tweets, through: :users
  has_many :follows
end
