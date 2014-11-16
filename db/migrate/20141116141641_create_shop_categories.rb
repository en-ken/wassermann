class CreateShopCategories < ActiveRecord::Migration
  def change
    create_table :shop_categories do |t|
      t.string :l_code
      t.string :s_code
      t.string :name

      t.timestamps
    end
  end

  def initialize
    req_url = "http://api.gnavi.co.jp/ver1/CategorySmallSearchAPI/"
    get_data = {keyid => ENV["GNAVI_KEYID"]}

    client = HTTPClient.new
    json_data = client.get_content(req_url, get_data)

    categories = JSON.parse(json_data)['response']
    categories.each do |category_s|
      cat = ShopsCategory.new
      cat.l_code = category_s['category_l_code']
      cat.s_code = category_s['category_s_code']
      cat.name = category_s['category_s_name']
      cat.save()
    end
end
