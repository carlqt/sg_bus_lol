json.stations @stations do |station|
  station = StationDecorator.new(station)
  json.code station.code
  json.description station.description
  json.buses station.all_buses do |bus|
    json.bus_code bus["code"]
    json.url bus_url(bus["code"], station_code: station.code)
    json.station_code station.code
    json.arrival_time bus["arrival_time"]
    json.next_bus_arrival_time bus["next_bus_arrival_time"]
  end
end
