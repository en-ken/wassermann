require 'nokogiri'

class InsertInitialShopCategories < ActiveRecord::Migration
  def change
    req_url = "http://api.gnavi.co.jp/ver1/CategorySmallSearchAPI/"
    get_data = {"keyid" => ENV["GNAVI_KEYID"]}

    client = HTTPClient.new
    xml_data = client.get_content(req_url, get_data)

    doc = Nokogiri::Slop(xml_data)
    doc.response.category_s.each do |cat_s|
      cat = ShopCategory.new
      cat.l_code = cat_s.category_l_code.content
      cat.s_code = cat_s.category_s_code.content
      cat.name = cat_s.category_s_name.content
      cat.save
      puts cat.l_code, cat.s_code, cat.name
    end
  end
end
