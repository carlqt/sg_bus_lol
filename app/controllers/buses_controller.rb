class BusesController < ApplicationController
  before_action :find_bus, only: :show

  def show
    @bus_routes = BusDecorator.new(@bus).routes_left_from(params[:station_code])
  end

  private
  def find_bus
    @bus = Bus.find_by(id: params[:id])
  end
end
