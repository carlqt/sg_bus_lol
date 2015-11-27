require 'delegate'

class StationDecorator < SimpleDelegator
  def all_buses
    response["Services"].map do |r|
      { "code" => r["ServiceNo"], "arrival_time" => minutes_remaining(r["NextBus"]["EstimatedArrival"]),
        "next_bus_arrival_time" => minutes_remaining(r["SubsequentBus"]["EstimatedArrival"]) }
    end
  end

  def model
    __getobj__
  end

  private
  def response
    @response ||= LTA.arrival(model.code)
  end

  def minutes_remaining(time)
    return if time.nil?
    arrival_time = ((time.to_time - Time.current) / 1.minutes ).round
  end
end
