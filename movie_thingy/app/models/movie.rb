class Movie < ActiveRecord::Base
  belongs_to :genre
  has_many :reviews
  has_many :ratings, :as => :rateable
end
