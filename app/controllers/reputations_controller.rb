class ReputationsController < ApplicationController
  GNAVI_REPT_URL='http://api.gnavi.co.jp/ouen/ver1/PhotoSearch'

  def index
    @loc_name = params[:location]
    data = JSON.parse (get_json_data(@loc_name))

    @shops = Array.new
    count = 0
    response = data['response']
    response.each do |key, value|
      if key == 'total_hit_count'
        count = value
      elsif key =~ (/[0-9]*/) #keyが数字のとき
        shop = Shop.new(value['shop_name'], value['shop_url'], value['comment'], value['image_url'], '')
        if shop.present? #コメントがあれば詰める
          @shops.push(shop)
        end
      end
    end
    session[:reputation] = @test
  end

  def get_json_data(loc_name)
    key_id = ENV["GNAVI_KEYID"]

    location = Location.find_by(name: loc_name)
    latitude_degree = location.latitude
    longitude_degree = location.longitude

    get_data = {
      'keyid' => key_id,
      'latitude' => latitude_degree,
      'longitude' => longitude_degree,
      'range' => 3, #1000m範囲
      'order' => 'distance',
      'format' => 'json'
    }
    client = HTTPClient.new
    begin
      return client.get_content(GNAVI_REPT_URL, get_data)
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end
  end

end
