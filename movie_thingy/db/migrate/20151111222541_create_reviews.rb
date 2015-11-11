class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :user_id
      t.text :content
      t.integer :photography
      t.integer :directing
      t.integer :cast
      t.integer :score
      t.integer :overall_effect

      t.timestamps null: false
    end
  end
end
