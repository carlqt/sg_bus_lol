class SiteController < ApplicationController
  def index
    @stations = Station.order(id: 'asc').page(params[:page]).per(10)
  end
end
