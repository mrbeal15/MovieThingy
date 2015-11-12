class Movie < ActiveRecord::Base
  belongs_to :genre
  has_many :reviews
  has_many :ratings, :as => :rateable

  has_attached_file :title_photo,
    :styles => { :small => "100x100>" },
    :storage => :fog,
    :fog_credentials => {
      # aws_access_key_id: "AKIAI5QTS4LK2N622FOA",
      # aws_secret_access_key: "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",
      # provider: "AWS"
      provider: 'Local',
      local_root: "#{Rails.root}/public/images",
      endpoint: 'http://localhost:3000/images'
    },
    :path => ":attachment/:id/:style.:extension",
    :fog_directory => 'moviethingphase3project';

  validates_attachment_content_type :title_photo, content_type: /\Aimage\/.*\Z/
end
