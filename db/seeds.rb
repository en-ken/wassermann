# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
require 'net/http'

BASE_URL = "http://maps.googleapis.com/maps/api/geocode/json"

loc_names = ['東京駅','有楽町駅','新橋駅','浜松町駅','田町駅','品川駅','大崎駅','五反田駅','目黒駅','恵比寿駅','渋谷駅','原宿駅','代々木駅','新宿駅','新大久保駅','高田馬場駅','目白駅','池袋駅','大塚駅','巣鴨駅','駒込駅','田端駅','西日暮里駅','日暮里駅','鶯谷駅','上野駅','御徒町駅','秋葉原駅','神田駅']
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
  sleep(1)
end
