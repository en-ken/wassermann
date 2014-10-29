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
    @locations = ['東京','有楽町','新橋','浜松町','田町','品川','大崎','五反田','目黒','恵比寿','渋谷','原宿','代々木','新宿','新大久保','高田馬場','目白','池袋','大塚','巣鴨','駒込','田端','西日暮里','日暮里','鶯谷','上野','御徒町','秋葉原','神田']
    @menu = params[:menu]
  end 
  
end
