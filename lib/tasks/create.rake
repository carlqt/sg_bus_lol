require 'httparty'
namespace :create_and_update do
  account_key = Rails.application.secrets['bus_key']
  unique_user_id = Rails.application.secrets['unique_user_key']
  headers = { 'UniqueUserID' => unique_user_id, 'AccountKey' => account_key, 'Accept' => 'application/json' }
  num = 0

  desc "TODO"
  task sbs_bus_services: :environment do

    loop do
      response = HTTParty.get "http://datamall.mytransport.sg/ltaodataservice.svc/SBSTRouteSet?$skip=#{num}", headers: headers
      bus_data = response['d']
      bus_data.each do |params|
        bus = Bus.find_or_initialize_by(number: params['SR_SVC_NUM'])
        routes_ids = bus.routes_ids ||= []
        routes_ids << params['SR_BS_CODE']
        looping = params['SR_SVC_DIR'].to_i == 2 ? false : true
        bus.update(loop: looping, corp: 'sbs', routes_ids: routes_ids)
      end

      break if response['d'].blank? || response['d'].count < 50 || num >= 100
      num += 50
    end
  end

  desc "TODO"
  task bus_stations: :environment do
    loop do
      response = HTTParty.get "http://datamall.mytransport.sg/ltaodataservice.svc/BusStopCodeSet?$skip=#{num}", headers: headers
      stations = response['d']

      stations.each do |params|
        station = Station.find_or_initialize_by(station_code: params['SR_SVC_NUM'])
        station.update(bus_code_id: params['BusStopCodeID'].to_i, station_code: params['Code'].to_i, road: params['Road'], summary: params['Summary'], description: params['Description'])
      end

      break if response['d'].blank? || response['d'].count < 50 || num >= 150
      num += 50
    end
  end

end
