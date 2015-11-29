class BusDecorator < BaseDecorator
  def routes_left_from(station_code)
    route_ids = route_ids_left(station_code)
    stations = Station.where(code: route_ids)
    route_ids.map do |station_code|
      stations.select{ |s| s.code == station_code }.first
    end
  end

  def subsequent_arrival_time(station)
    @subsequent_arrival_time ||= arrival_time_of_bus(station)
  end

  def arrival_time_in_station(station)
    @arrival_time ||= arrival_time_of_bus(station)
  end

  private
  def route_ids_left(station_code)
    return model.routes_ids if station_code.nil?
    index = model.routes_ids.index(station_code)
    model.routes_ids[index..-1]
  end

  def arrival_time_of_bus(station)
    response = LTA.arrival(station, model.number)
    @subsequent_arrival_time = response["Services"].first["SubsequentBus"]["EstimatedArrival"]
    @arrival_time = response["Services"].first["NextBus"]["EstimatedArrival"]

    @subsequent_arrival_time = minutes_remaining(@subsequent_arrival_time)
    @arrival_time = minutes_remaining(@arrival_time)
  end
end
