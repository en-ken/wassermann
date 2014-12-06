class CharactersController < ApplicationController

  @loc_name #場所のデータ保持用(indexからView経由でselectに渡す)
  @charas #雰囲気の表示用(index)

  #「雰囲気で選ぶ」選択後の処理
  def index
    @loc_name = params[:location]
    @charas = get_charas
  end

  #雰囲気選択後の遷移
  def select
    redirect_to shops_url(:loc_name => params[:loc_name], :chara => params[:chara])
  end

  #「運命で選ぶ」選択後の処理
  def select_random
    loc_name = params[:location]
    chara = Character.offset(rand(Character.count)).first #ランダムに表示するための処理
    redirect_to shops_url(:loc_name => loc_name, :chara => chara.character)
  end

  private #===== 以下プライベートメソッド =====

  #DBからcharacterのみ取得
  def get_charas
    return Character.pluck(:character)
  end
end
