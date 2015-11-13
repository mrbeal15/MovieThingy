class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  has_many :ratings, :as => :rateable
  has_many :comments

  def review_average_rating
    # user = User.find_by(id: :user_id)
    # user_reviews = current_user.reviews
    sum = []
    user = self.user
    user.reviews.last.ratings.each do |rate|
      sum << rate.rating
    end
    total = sum.reduce(:+)
    average = total / sum.length
    return average
  end


end
