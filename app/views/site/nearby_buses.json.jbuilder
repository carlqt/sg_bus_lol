json.stations @stations do |station|
  json.code station.code
  json.description station.description
  json.buses station.buses.pluck(:number) do |bus|
    json.bus_code bus
    json.url bus_url(bus, station_code: station.code)
  end
end
