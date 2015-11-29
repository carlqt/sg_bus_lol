class StationDecorator < BaseDecorator
  def all_buses
    response["Services"].map do |r|
      { "code" => r["ServiceNo"], "arrival_time" => minutes_remaining(r["NextBus"]["EstimatedArrival"]),
        "next_bus_arrival_time" => minutes_remaining(r["SubsequentBus"]["EstimatedArrival"]) }
    end
  end

  private
  def response
    @response ||= LTA.arrival(model.code)
  end

end
