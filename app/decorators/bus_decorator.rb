class BusDecorator
  attr_reader :model
  def initialize(model)
    @model = model
  end

  def routes_left_from(station_code)
    route_ids = route_ids_left(station_code)
    stations = Station.where(code: route_ids)
    route_ids.map do |station_code|
      stations.select{ |s| s.code == station_code }.first
    end
  end

  private
  def route_ids_left(station_code)
    return model.routes_ids if station_code.nil?
    index = model.routes_ids.index(station_code)
    model.routes_ids[index..-1]
  end
end
