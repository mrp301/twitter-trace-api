class User < ApplicationRecord
  has_many :follows
  has_many :tweets
  has_many :follows_tweets, through: :follows, source: :tweet
end
