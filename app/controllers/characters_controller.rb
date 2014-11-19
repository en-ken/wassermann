require 'csv'

class CharactersController < ApplicationController

  @location #場所のデータ保持用
  @charas #雰囲気の表示用

  def index
    @location = params[:location]
    @charas = get_charas()
    puts @charas
  end

  def select
    #keywords = get_keywords(params[:chara])
    redirect_to shops_multi_url, location:@location character:params[:chara]
  end

  #for CSV(一時的 - characterとcond1...10)
=begin
  def get_charas
    @table = CSV.table('characters_tmp.csv', encoding: 'UTF-8:UTF-8')
    return @table[:character]
  end

  def get_keywords(chara)
    #charaのcondをすべて取得する
    keywords = @table.find{|row| row['character'] == chara} #一致する行を取得
        .fields(1...11) #keyword1..10を取得
        .delete_if{|kw| kw.empty?} #空要素削除
    puts keywords
    return keywords
  end
=end

  #for DB(characterとcondsのみ)
  def get_charas
    return Character.select(:character)
  end

  def get_keywords(chara)
    chara = Character.find_by(:character => chara)
    return chara.keywords.slpit(','); #keywordsを配列
  end

end
