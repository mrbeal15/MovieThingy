module ApplicationHelper
  def average_rating(type)
    array = Rating.find_by(rateable_type: type, rateable_id: id)
    average = array.reduce(:+) / array.length
    average
  end

end
