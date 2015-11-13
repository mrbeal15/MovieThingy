class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :comments
  has_many :ratings, :as => :rateable

  def is_trusted?
    sum = 0
    self.reviews.each do |review|
      sum += review.ratings.rating
    end
    if sum = 0
      return "Currently has no rated reviews"
    else
      return sum / self.reviews.ratings.count
    end
  end
end

