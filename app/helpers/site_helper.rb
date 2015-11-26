module SiteHelper
  def color_code(time)
    return if time == "not available"
    if time >= 10
      "alert"
    elsif (5..9).include?(time)
      "warning"
    else
      "success"
    end
  end
end
