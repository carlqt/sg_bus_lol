class Location
  attr_reader :longitude, :latitude
  class << self
    def nearby_buses
      places_api_url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
      coords = get_coordinates
      params = { key: ENV['GOOGLE_SERVER_KEY'], location: "#{coords[:latitude]},#{coords[:longitude]}", radius: 500, types: "bus_station" }.with_indifferent_access
      response = HTTParty.get places_api_url, query: params
      response['results'].map { |station| station['name'] }
    end

    private
    def get_coordinates
      response = HTTParty.get "http://ip-api.com/json"
      { longitude: response["lon"], latitude: response["lat"] }
    end
  end
end
