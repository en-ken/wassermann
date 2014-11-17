class ShopsController < ApplicationController
  def index
    @menu_name = params[:menu_name]
    @loc_name = params[:loc_name]
    data = JSON.parse (get_json_data)
    @shops = Array.new
    if data['error'] then
      puts data['error']['code'] 
    else
      data['rest'].each do |rest|
        shop = Shop.new(rest['name'], rest['url'], rest['pr']['short'], rest['image_url'], '')
        @shops.push(shop)
      end
    end
  end

  def get_json_data
    #TODO:エラー処理が必要

    key_id = ENV["GNAVI_KEYID"]
    category_s_code = "RSFST08002"
    if @menu_name == "ラーメン"
      category_s_code = "RSFST08008"
    end
    location = Location.find_by(name: @loc_name)
    latitude_degree = location.latitude
    longitude_degree = location.longitude

    req_param =
      "keyid=" + key_id +
      "&category_s=" + category_s_code +
      "&pref=PREF13" +
      "&latitude=" + latitude_degree +
      "&longitude=" + longitude_degree +
      "&range=2" +
      "&format=json"
    req_url="http://api.gnavi.co.jp/ver1/RestSearchAPI/?"
    puts req_url + req_param
    return HTTPClient.new.get_content(req_url + req_param)
  end

end

