class AddAvgScoreToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :avg_score, :integer
  end
end
