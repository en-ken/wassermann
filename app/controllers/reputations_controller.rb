class ReputationsController < ApplicationController
  def index
    #@loc_name = params[:loc_name]
    data = JSON.parse (get_json_data)
    @comment = Array.new
    @test = Array.new
    for num in 0..14 do
      photo = data["response"][num.to_s]["photo"]
      shop = Shop.new(photo['shop_name'], photo['shop_url'], photo['comment'], photo['image_url']['url_320'], '')
      @comment.push(shop)
      @test.push(shop)
    end
    session[:reputation] = @test
  end

  def get_json_data
    #TODO:エラー処理が必要

    key_id = ENV["GNAVI_KEYID"]
    #location = Location.find_by(name: @loc_name)
    #latitude_degree = location.latitude
    #longitude_degree = location.longitude
    latitude_degree = "35.658517"
    longitude_degree = "139.701334"

    req_param =
      "keyid=" + key_id +
      "&latitude=" + latitude_degree +
      "&longitude=" + longitude_degree +
      "&range=2" +
      "&order=distance" +
      "&format=json"
    req_url="http://api.gnavi.co.jp/ouen/ver1/PhotoSearch/?"
    puts req_url + req_param
    return HTTPClient.new.get_content(req_url + req_param)
  end

end
