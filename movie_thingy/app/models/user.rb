class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :comments
  has_many :ratings, :as => :rateable

  def trusted?
    sum = 0
    self.reviews.each do |review|
      next if review.review_average_rating == 0
      sum += review.review_average_rating
    end
    if sum / (self.reviews.length) < 4
      return sum / self.reviews.length
    else
      self.trusted_user = true
    end
  end
end
