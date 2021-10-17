class User < ApplicationRecord
   validates :uid, uniqueness: true
   has_many :likes
   has_many :like_tweets, through: :likes, source: :tweet
end
