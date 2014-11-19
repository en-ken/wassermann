class WelcomeController < ApplicationController
  def index
  end

  def choose
    @locations = ['東京駅','有楽町駅','新橋駅','浜松町駅','田町駅','品川駅','大崎駅','五反田駅','目黒駅','恵比寿駅','渋谷駅','原宿駅','代々木駅','新宿駅','新大久保駅','高田馬場駅','目白駅','池袋駅','大塚駅','巣鴨駅','駒込駅','田端駅','西日暮里駅','日暮里駅','鶯谷駅','上野駅','御徒町駅','秋葉原駅','神田駅']
    render :layout => 'application', :action => "choice"
  end

end
