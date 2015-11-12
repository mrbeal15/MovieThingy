class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :name
      t.integer :rateable_id
      t.string :rateable_type

      t.timestamps null: false
    end

    add_index :ratings, :rateable_id
  end
end
