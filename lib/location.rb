class Location
  attr_reader :longitude, :latitude
  class << self
    def nearby_buses(lat, long)
      places_api_url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
      params = { key: ENV['GOOGLE_SERVER_KEY'], location: "#{lat},#{long}", radius: 500, types: "bus_station" }.with_indifferent_access
      response = HTTParty.get places_api_url, query: params
      return response['status'] unless response["status"] == "OK"
      stations = {}
      stations[:bus_stops] = response['results'].map { |station| station['name'] }
      stations
    end
  end
end
