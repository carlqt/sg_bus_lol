class Bus < ActiveRecord::Base
  validates :number, uniqueness: true

  def routes_from(station_code)
    index = self.routes_ids.index(station_code)
    self.routes_ids[index..-1]
  end
end
