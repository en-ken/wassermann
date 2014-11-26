
class ShopsController < ApplicationController
  GNAVI_REST_URL='http://api.gnavi.co.jp/ver1/RestSearchAPI/'

  def index
    @menu_name = params[:menu_name]
    @loc_name = params[:loc_name]
    data = JSON.parse (get_json_data(loc_name))
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

  def multi
    @loc_name = params[:loc_name]
    @chara = params[:chara]
    freewords = get_freewords(@chara)
    data = JSON.parse (get_json_data(@loc_name, freewords))

    @shops = Array.new
    if data['error'] then
      puts data['error']['code']
    else
      data['rest'].each do |rest|
      img_url = "/images/noimage.png"
      img_url1 = rest['image_url']['shop_image1']
      img_url2 = rest['image_url']['shop_image2']
      if img_url1.empty? then
        if img_url2.present? then
          img_url = img_url2
        end
      else
        img_url = img_url1
      end
      keywords = rest['code']['category_name_s']
      keywords.delete_if {
        |word| word.is_a? Hash
      }
      puts keywords
      shop = Shop.new(rest['name'], rest['url'], rest['pr']['short'], img_url, rest['code']['category_name_s'])
        @shops.push(shop)
      end
    end
  end

  def single
    @shop = Shop.new(params[:shop_name], params[:shop_url], params[:comment], params[:image_url], '')
  end

  #JSONデータを取得する
  def get_json_data(loc_name, freewords='')
    #TODO:エラー処理が必要
    key_id = ENV["GNAVI_KEYID"]

    location = Location.find_by(:name => loc_name)
    latitude_degree = location.latitude
    longitude_degree = location.longitude

    get_data = {
      'keyid' => key_id,
      'input_coordinates_mode' => 2, #世界標準系指定
      'latitude' => latitude_degree,
      'longitude' => longitude_degree,
      'range' => 3, #1000m範囲
      #'category_s' => '',
      'freeword' => freewords,
      'freeword_condition' => 2, #OR検索
      'format' => 'json'
    }
    client = HTTPClient.new
    begin
      return client.get_content(GNAVI_REST_URL, get_data)
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end
  end

  #DBから雰囲気に紐づくfreeword(フリーワード)を取得する
  def get_freewords(chara)
    chara = Character.find_by(character:chara)
    return chara.freewords
  end
end
