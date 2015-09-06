class Station < ActiveRecord::Base
  validates :bus_code_id, :station_code, uniqueness: true

  def buses
    Bus.where("? = ANY (routes_ids)", self.station_code)
  end
end
