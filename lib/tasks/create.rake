require 'httparty'
namespace :create_and_update do
  desc "TODO"
  task sbs_bus_services: :environment do
    account_key = Rails.application.secrets['bus_key']
    unique_user_id = Rails.application.secrets['unique_user_key']
    headers = { 'UniqueUserID' => unique_user_id, 'AccountKey' => account_key, 'Accept' => 'application/json' }
    num = 0

    loop do
      response = HTTParty.get "http://datamall.mytransport.sg/ltaodataservice.svc/SBSTRouteSet?$skip=#{num}", headers: headers
      bus_data = response['d']
      loop do
        # loop until finished with saving data

      end

      break if response['d'].blank? || response['d'].count < 50
      num += 50
    end
    response = HTTParty.get "http://datamall.mytransport.sg/ltaodataservice.svc/SBSTRouteSet", headers: headers
  end

  desc "TODO"
  task bus_stations: :environment do
  end

end
