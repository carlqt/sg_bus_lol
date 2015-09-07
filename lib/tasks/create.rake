require 'httparty'
namespace :create_and_update do
  account_key = Rails.application.secrets['bus_key']
  unique_user_id = Rails.application.secrets['unique_user_key']
  headers = { 'UniqueUserID' => unique_user_id, 'AccountKey' => account_key, 'Accept' => 'application/json' }
  num = 0
  ctr = 0

  desc "TODO"
  task sbs_bus_services: :environment do
    progress_bar = ProgressBar.create total: 325

    loop do
      progress_bar.increment
      response = HTTParty.get "http://datamall.mytransport.sg/ltaodataservice.svc/SBSTRouteSet?$skip=#{num}", headers: headers
      bus_data = response['d']

      bus_data.each do |params|
        bus = Bus.find_or_initialize_by(number: params['SR_SVC_NUM'])
        routes_ids = bus.routes_ids ||= []
        routes_ids << params['SR_BS_CODE']
        looping = params['SR_SVC_DIR'].to_i == 2 ? false : true
        bus.update(loop: looping, corp: 'sbs', routes_ids: routes_ids)
      end

      ctr += 1
      break if response['d'].blank? || response['d'].count < 50
      num += 50
    end
    puts "There are a total of #{ctr} api calls to get the data"
  end

  desc "TODO"
  task bus_stations: :environment do
    Station.create(code: '01012', description: 'Hotel Grand Pacific', road: 'Victoria St')
    progress_bar = ProgressBar.create total: 103
    loop do
      response = HTTParty.get "http://datamall.mytransport.sg/ltaodataservice.svc/BusStopCodeSet?$skip=#{num}", headers: headers
      stations = response['d']
      progress_bar.increment

      stations.each do |params|
        station = Station.find_or_initialize_by(code: params['SR_SVC_NUM'])
        station.update(bus_code_id: params['BusStopCodeID'].to_i, code: params['Code'], road: params['Road'], summary: params['Summary'], description: params['Description'])
      end

      ctr += 1
      break if response['d'].blank? || response['d'].count < 50
      num += 50
    end
    puts "There are a total of #{ctr} api calls to get the data"
  end

  desc "TODO"
  task smrt_bus_services: :environment do
    progress_bar = ProgressBar.create total: 131

    loop do
      progress_bar.increment
      response = HTTParty.get "http://datamall.mytransport.sg/ltaodataservice.svc/SMRTRouteSet?$skip=#{num}", headers: headers
      bus_data = response['d']

      bus_data.each do |params|
        bus = Bus.find_or_initialize_by(number: params['SR_SVC_NUM'])
        routes_ids = bus.routes_ids ||= []
        routes_ids << params['SR_BS_CODE']
        looping = params['SR_SVC_DIR'].to_i == 2 ? false : true
        bus.update(loop: looping, corp: 'smrt', routes_ids: routes_ids)
      end

      ctr += 1
      break if response['d'].blank? || response['d'].count < 50
      num += 50
    end
    puts "There are a total of #{ctr} api calls to get the data"
  end
end
