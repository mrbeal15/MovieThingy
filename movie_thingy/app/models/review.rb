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
    if sum.length == 0
      return 'Currently no ratings'
    else
      return total / sum.length
    end
  end

  has_attached_file :photo_1,
    :styles => { :medium => "300x300>" },
    :storage => :fog,
    :fog_credentials => {
      provider: 'Local',
      local_root: "#{Rails.root}/public/images",
      endpoint: 'http://localhost:3000/images'
    },
    :path => ":attachment/:id/:style.:extension",
    :fog_directory => 'moviethingphase3project';

    has_attached_file :photo_2,
      :styles => { :medium => "300x300>" },
      :storage => :fog,
      :fog_credentials => {
        provider: 'Local',
        local_root: "#{Rails.root}/public/images",
        endpoint: 'http://localhost:3000/images'
      },
      :path => ":attachment/:id/:style.:extension",
      :fog_directory => 'moviethingphase3project';

     has_attached_file :photo_3,
      :styles => { :medium => "300x300>" },
      :storage => :fog,
      :fog_credentials => {
        provider: 'Local',
        local_root: "#{Rails.root}/public/images",
        endpoint: 'http://localhost:3000/images'
      },
      :path => ":attachment/:id/:style.:extension",
      :fog_directory => 'moviethingphase3project';

    has_attached_file :photo_4,
      :styles => { :medium => "300x300>" },
      :storage => :fog,
      :fog_credentials => {
        provider: 'Local',
        local_root: "#{Rails.root}/public/images",
        endpoint: 'http://localhost:3000/images'
      },
      :path => ":attachment/:id/:style.:extension",
      :fog_directory => 'moviethingphase3project';

    has_attached_file :photo_5,
      :styles => { :medium => "300x300>" },
      :storage => :fog,
      :fog_credentials => {
        provider: 'Local',
        local_root: "#{Rails.root}/public/images",
        endpoint: 'http://localhost:3000/images'
      },
      :path => ":attachment/:id/:style.:extension",
      :fog_directory => 'moviethingphase3project';

      validates_attachment_content_type :photo_1, content_type: /\Aimage\/.*\Z/
      validates_attachment_content_type :photo_2, content_type: /\Aimage\/.*\Z/
      validates_attachment_content_type :photo_3, content_type: /\Aimage\/.*\Z/
      validates_attachment_content_type :photo_4, content_type: /\Aimage\/.*\Z/
      validates_attachment_content_type :photo_5, content_type: /\Aimage\/.*\Z/

end
