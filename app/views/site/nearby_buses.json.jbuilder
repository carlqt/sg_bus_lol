json.stations @stations do |station|
  station = StationDecorator.new(station)
  json.code station.code
  json.description station.description
end
