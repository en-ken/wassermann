class CharactersController < ApplicationController
  @locations
  @character
  @charas

  def index
    @location = @params[:location]
    @charas = get_character(chara)
  end

  def select
    @character = @params[:character]
    conds = get_cond(@character)
    conds.each do |cond|
      cat = ShopCategory.find_by(:name => /.*cond.*/) #condに部分一致するテーブル取得
    end
  end

  #for CSV(一時的 - characterとcond1...10)
  def get_character(chara)
    @table = CSV.table('character_condition.csv', encoding: 'UTF-8:UTF-8')
    return @table['character']
  end
  def get_conditions(chara)
    #charaのcondをすべて取得する
    conds
      = @table.find{|row| row['character'] == chara} #一致する行を取得
        .fields(1...11) #cond1...cond10を取得
        .delte_if{|cond| => cond.empty?} #空要素削除
    put conds
    return conds
  end

  #for DB(characterとcondsのみ)
=begin
  def get_character(chara)
    return CharaCond.select('character')
  end
  def get_conditions(chara)
    chara_cond = CharaCond.find_by(:character => chara)
    conds = chara_cond.conds.slpit(',');
  end
=end

  def suggest
    @locations = ['東京','有楽町','新橋','浜松町','田町','品川','大崎','五反田','目黒','恵比寿','渋谷','原宿','代々木','新宿','新大久保','高田馬場','目白','池袋','大塚','巣鴨','駒込','田端','西日暮里','日暮里','鶯谷','上野','御徒町','秋葉原','神田']
    @menu = params[:menu]
    redirect_to :controller => "menus", :action => "suggest", :menu => @menu
  end

end
