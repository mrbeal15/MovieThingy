class RemoveNameFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :name, :string
  end
end
