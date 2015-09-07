class SiteController < ApplicationController
  def index
    @stations = Station.page(params[:page]).per(10)
  end
end
