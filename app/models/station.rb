class Station < ActiveRecord::Base
  validates :bus_code_id, :station_code, uniqueness: true

  def self.buses

  end
end
