require 'json'
require 'net/http'

GMAP_URL = "http://maps.googleapis.com/maps/api/geocode/json"
LOC_NAMES = ['東京駅','有楽町駅','新橋駅','浜松町駅','田町駅','品川駅','大崎駅','五反田駅','目黒駅','恵比寿駅','渋谷駅','原宿駅','代々木駅','新宿駅','新大久保駅','高田馬場駅','目白駅','池袋駅','大塚駅','巣鴨駅','駒込駅','田端駅','西日暮里駅','日暮里駅','鶯谷駅','上野駅','御徒町駅','秋葉原駅','神田駅']

class InsertInitialLocations < ActiveRecord::Migration
  def change
    LOC_NAMES.each do |loc_name|
      url = "#{GMAP_URL}?address=#{URI.encode(loc_name)}&sensor=false&language=ja"
      res = Net::HTTP.get_response(URI.parse(url))
      status = JSON.parse(res.body)
      if status['status'] == "OK"
        location = Location.new
        location.name = loc_name
        location.latitude = status['results'][0]['geometry']['location']['lat']
        location.longitude = status['results'][0]['geometry']['location']['lng']
        location.save
        puts location.name, location.latitude, location.longitude
      end
      sleep(1)
    end
  end
end
