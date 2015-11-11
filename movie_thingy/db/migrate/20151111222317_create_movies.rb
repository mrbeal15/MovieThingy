class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :genre_id
      t.string :title
      t.string :director
      t.integer :release_year
      t.integer :runtime
      t.string :mppa_rating
      t.text :cast

      t.timestamps null: false
    end
  end
end
