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
    if sum == 0
      return "User currently has no rated reviews"
    elsif sum / (self.reviews.length) < 4
      self.trusted_user = false
    else
      self.trusted_user = true
      return "Trusted User"
    end
  end
end
