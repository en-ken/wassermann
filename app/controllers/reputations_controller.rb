class ReputationsController < ApplicationController

  #「評判で選ぶ」選択後の処理
  def index
    @loc_name = params[:location]
    @shops = Shop.search_reputation(@loc_name)
    session[:shops] = @shops
  end

end
