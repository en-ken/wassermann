class ShopsController < ApplicationController
  def index
    @menu_name = params[:menu_name]
    data = JSON.parse (get_json_data)
    @shops = Array.new
    data['rest'].each do |rest|
      shop = Shop.new(rest['name'], rest['url'])   
      @shops.push(shop)
    end
    #　後藤さんの実装待ち. 下記は削除される予定
    @menu_name = 'うどん'
  end

  def get_json_data
    #TODO:エラー処理が必要
    
    key_id = ENV["GNAVI_KEYID"]
    category_s_code = "RSFST08002"
    req_param =
      "keyid=" + key_id +
      "&category_s=" category_s_code +
      "&pref=PREF13" +
      "&address=%E6%9D%B1%E4%BA%AC%E9%83%BD%E6%B8%8B%E8%B0%B7%E5%8C%BA"+
      "&format=json"
    req_url="http://api.gnavi.co.jp/ver1/RestSearchAPI/?"
    return HTTPClient.new.get_content(req_url + req_param)
  end

end
