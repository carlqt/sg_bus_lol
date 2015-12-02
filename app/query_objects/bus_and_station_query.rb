class BusAndStationQuery
  def self.find(code)
    bus = Bus.find_by(number: code)

    return bus if bus.present?
    return Station.find_by(code: code)
  end
end
