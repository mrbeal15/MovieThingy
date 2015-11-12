class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  has_many :ratings, :as => :rateable
  has_many :comments

  
end
