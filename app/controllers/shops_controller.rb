class ShopsController < ApplicationController
  def index
    data = JSON.parse (get_json_data)
    @shops = Array.new
    data['rest'].each do |rest|
      shop = Shop.new(rest['name'], rest['url'])   
      @shops.push(shop)
    end
  end

  def get_json_data
    #TODO:エラー処理が必要

    key_id = ENV["GNAVI_KEYID"]
    req_param =
      "keyid=" + key_id +
      "&category_s=RSFST08002" +
      "&pref=PREF13" +
      "&address=%E6%9D%B1%E4%BA%AC%E9%83%BD%E6%B8%8B%E8%B0%B7%E5%8C%BA"+
      "&format=json"
    req_url="http://api.gnavi.co.jp/ver1/RestSearchAPI/?"
    return HTTPClient.new.get_content(req_url + req_param)
  end

end
