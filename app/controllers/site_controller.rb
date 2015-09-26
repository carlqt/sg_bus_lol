class SiteController < ApplicationController
  def index
    @stations = Station.order(id: 'asc').page(params[:page]).per(10)
  end

  def location
  end

  def nearby_buses
    @stations = Location.nearby_buses(params[:lat], params[:long])
    render json: @stations
  end
end