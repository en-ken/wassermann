require 'json'
require 'net/http'

BASE_URL = "http://maps.googleapis.com/maps/api/geocode/json"

class InsertInitialLocations < ActiveRecord::Migration
  def change
    loc_names = ['東京','有楽町','新橋','浜松町','田町','品川','大崎','五反田','目黒','恵比寿','渋谷','原宿','代々木','新宿','新大久保','高田馬場','目白','池袋','大塚','巣鴨','駒込','田端','西日暮里','日暮里','鶯谷','上野','御徒町','秋葉原','神田']
    loc_names.each do |loc_name|
      url = "#{BASE_URL}?address=#{URI.encode(loc_name)}&sensor=false&language=ja"
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
      sleep(1) #リクエスト制限があるので1秒ごとに処理する
    end
  end
end
