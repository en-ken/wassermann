
class ShopsController < ApplicationController

  @shop #表示する店の情報

  def index
    if params[:number].present? #評判から来た場合
      i = params[:number].to_i
      @shop = session[:shops][i]
    else #雰囲気または運命から来た場合
      @loc_name = params[:loc_name]
      @chara = params[:chara]
      freewords = get_freewords(@chara)

      shops = Shop.search_shops_from_rest_api(@loc_name, freewords)
      if shops.blank?
        @shop = nil
      else
        @shop = shops[rand(shops.length)]
      end
    end
  end

  #JSONデータを取得する

  #DBから雰囲気に紐づくfreeword(フリーワード)を取得する
  def get_freewords(chara)
    chara = Character.find_by(character:chara)
    return chara.freewords
  end
end
