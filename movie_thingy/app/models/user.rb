class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :comments
  has_many :ratings, :as => :rateable
end
 