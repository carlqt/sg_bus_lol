json.buses @buses do |bus|
  bus = BusDecorator.new(bus)
  json.bus_code bus.number
  json.url bus_url(bus.number, station_code: params[:station])
  json.arrival_time bus.arrival_time_in_station(params[:station])
  json.next_bus_arrival_time bus.subsequent_arrival_time(params[:station])
end

json.station_code params[:station]
