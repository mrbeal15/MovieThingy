module ApplicationHelper
  def average_rating(type)
    array = Rating.find_by(rateable_type: type, rateable_id: id)
    average = array.reduce(:+) / array.length
    average
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id])
  end

  def logged_in?
    session[:current_user_id] != nil
  end
end
