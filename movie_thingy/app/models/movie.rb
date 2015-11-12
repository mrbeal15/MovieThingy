class Movie < ActiveRecord::Base
  belongs_to :genre
  has_many :reviews
  has_many :ratings, :as => :rateable

  has_attached_file :title_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
