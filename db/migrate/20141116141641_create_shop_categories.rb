require 'json'
require 'net/http'

class CreateShopCategories < ActiveRecord::Migration
  def change
    create_table :shop_categories do |t|
      t.string :l_code
      t.string :s_code
      t.string :name

      t.timestamps
    end
  end
end
