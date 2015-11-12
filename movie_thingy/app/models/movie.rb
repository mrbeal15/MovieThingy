class Movie < ActiveRecord::Base
  belongs_to :genre
  has_many :reviews
  has_many :ratings, :as => :rateable

  has_attached_file :title_photo,
    :styles => { :medium => "300x300>" },
    :storage => :s3,
    :s3_permissions => 'public-read',
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'moviethingphase3project';

  validates_attachment_content_type :title_photo, content_type: /\Aimage\/.*\Z/
end
