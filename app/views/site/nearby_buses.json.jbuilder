json.station @stations do |station|
  json.code station.code
  json.description station.description
  json.buses station.buses.pluck(:number)
end
