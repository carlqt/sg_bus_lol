module LTA
  def self.arrival(bus = nil, station)
    bus = "&ServiceNo=#{bus}" unless bus.nil?
    api_url = "http://datamall2.mytransport.sg/ltaodataservice/BusArrival?BusStopID=#{station}#{bus}"
    HTTParty.get api_url, headers: headers
  end

  private

  def self.headers
    { 'UniqueUserID' => unique_user_id, 'AccountKey' => account_key, 'Accept' => 'application/json' }
  end

  def self.account_key
    Rails.application.secrets['bus_key']
  end

  def self.unique_user_id
    Rails.application.secrets['unique_user_key']
  end
end
