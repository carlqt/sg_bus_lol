class Station < ActiveRecord::Base
  validates :bus_code_id, :code, uniqueness: true
  geocoded_by :code
  reverse_geocoded_by :latitude, :longitude

  def buses
    Bus.where("? = ANY (routes_ids)", self.code)
  end
end
