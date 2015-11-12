class AddColumnToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :rating, :integer
  end
end
