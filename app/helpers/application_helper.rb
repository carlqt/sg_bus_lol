module ApplicationHelper
  def color_code(time)
    return if time.nil?
    if time >= 10
      "alert"
    elsif (5..9).include?(time)
      "warning"
    else
      "success"
    end
  end

  def display_arrival_time(time)
    return "Not Available" if time.nil? 
    return "Arriving" if time <= 0
    return "1 minute" if time == 1
    "#{time} minutes"
  end
end
