class ShopsController < ApplicationController
  def index
    httpClient = HTTPClient.new
    data = httpClient.get_content('http://api.gnavi.co.jp/ver1/RestSearchAPI/?keyid=6b8968b2ac5d3bc085b161fc60f67cff&category_s=RSFST08002&pref=PREF13&address=%E6%9D%B1%E4%BA%AC%E9%83%BD%E6%B8%8B%E8%B0%B7%E5%8C%BA&format=json')
    jsonData = JSON.parse (data)
    @shops = Array.new
    jsonData['rest'].each do |rest|
      shop = Shop.new(rest['name'], rest['url'])   
      @shops.push(shop)
    end
  end

end
