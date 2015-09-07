class BusDecorator < SimpleDelegator
  def routes_left(station_code)
    stations = Station.where(station_code: model.routes_from(station_code))
    stations.map(&:description)
  end

  def model
    __getobj__
  end
end
