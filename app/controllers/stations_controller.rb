class StationsController < ApplicationController
  before_action :find_station

  def show
    @station = StationDecorator.new(@station)
  end

  private
  def find_station
    @station = Station.find(params[:id])
  end
end
