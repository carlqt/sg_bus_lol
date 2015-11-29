require 'delegate'

class BaseDecorator < SimpleDelegator
  def model
    __getobj__
  end

  def minutes_remaining(time)
    return if time.nil?
    arrival_time = ((time.to_time - Time.current) / 1.minutes ).round
  end
end

