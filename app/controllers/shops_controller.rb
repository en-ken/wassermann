
class ShopsController < ApplicationController
  GNAVI_REST_URL='http://api.gnavi.co.jp/ver1/RestSearchAPI/'

  @shop #表示する店の情報

  def index
    if params[:number].present? #評判から来た場合
      i = params[:number].to_i
      @shop = session[:shops][i]
      puts @shop.img_url
    else #雰囲気または運命から来た場合
      @loc_name = params[:loc_name]
      @chara = params[:chara]
      freewords = get_freewords(@chara)
      data = JSON.parse (get_json_data(@loc_name, freewords))

      shops = Array.new
      if data['error'] then
        puts data['error']['code']
      else
        data['rest'].each do |rest|
          img_url = "/images/noimage.png"
          img_url1 = rest['image_url']['shop_image1']
          img_url2 = rest['image_url']['shop_image2']
          if img_url1.present?
            img_url = img_url1
          elsif img_url2.present?
            img_url = img_url2
          end
          keywords = rest['code']['category_name_s']
          keywords.delete_if {
            |word| word.is_a? Hash
          }
          puts keywords
          shop = Shop.new(rest['name'], rest['url'], rest['pr']['short'], img_url, rest['code']['category_name_s'])
          shops.push(shop)
        end
      end
      @shop = shops[rand(shops.length)]
    end
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
