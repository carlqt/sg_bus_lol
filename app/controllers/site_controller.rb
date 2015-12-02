class SiteController < ApplicationController
  def index
    @stations = Station.order(id: 'asc').page(params[:page]).per(10)
  end

  def location
  end

  def search
    q = BusAndStationQuery.find(params[:search])
    return redirect_to station_path(q.id) if q.is_a? Station
    return redirect_to bus_path(q.id) if q.is_a? Bus
    raise ActionController::RoutingError.new('Not Found')
  end

  def nearby_buses
    @stations = Location.nearby_buses1(params[:lat], params[:long])
  end

  def reload_station
    station = Station.find_by(code: params[:station])
    @buses = station.buses
  end
end
