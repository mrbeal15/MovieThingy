class AddPhotoToMovies < ActiveRecord::Migration
  def up
    add_attachment :movies, :title_photo
  end

  def down
    remove_attachment :movies, :title_photo
  end
end
