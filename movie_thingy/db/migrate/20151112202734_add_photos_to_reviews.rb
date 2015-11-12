class AddPhotosToReviews < ActiveRecord::Migration
  def up
    add_attachment :reviews, :photo_1
    add_attachment :reviews, :photo_2
    add_attachment :reviews, :photo_3
    add_attachment :reviews, :photo_4
    add_attachment :reviews, :photo_5
  end

  def down
    remove_attachment :reviews, :photo_1
    remove_attachment :reviews, :photo_2
    remove_attachment :reviews, :photo_3
    remove_attachment :reviews, :photo_4
    remove_attachment :reviews, :photo_5
  end
end
