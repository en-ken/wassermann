class MenusController < ApplicationController
  def index
  end

  def explore
    feel = params[:feel]
    if feel == nil then
      render :action => "index"
    else
      if feel == "light" then
        @menu = "うどん"
      else
        @menu = "ラーメン"
      end
      redirect_to :action => "suggest", :menu => @menu 
    end
  end

  def suggest
    @locations = ['東京駅','有楽町駅','新橋駅','浜松町駅','田町駅','品川駅','大崎駅','五反田駅','目黒駅','恵比寿駅','渋谷駅','原宿駅','代々木駅','新宿駅','新大久保駅','高田馬場駅','目白駅','池袋駅','大塚駅','巣鴨駅','駒込駅','田端駅','西日暮里駅','日暮里駅','鶯谷駅','上野駅','御徒町駅','秋葉原駅','神田駅']
    @menu = params[:menu]
  end 
  
end
