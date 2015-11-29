class SiteController < ApplicationController
  def index
    @stations = Station.order(id: 'asc').page(params[:page]).per(10)
  end

  def location
  end

  def nearby_buses
    @stations = Location.nearby_buses1(params[:lat], params[:long])
  end

  def reload_station
    station = Station.find_by(code: params[:station])
    @buses = station.buses
  end
end
