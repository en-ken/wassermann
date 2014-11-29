class CharactersController < ApplicationController

  @loc_name #場所のデータ保持用(indexからView経由でselectに渡す)
  @charas #雰囲気の表示用(index)

  def index
    @loc_name = params[:location]
    @charas = get_charas
  end

  #character選択後の遷移
  def select
    redirect_to shops_url(:loc_name => params[:loc_name], :chara => params[:chara])
  end

  def select_random
    loc_name = params[:location]
    chara = Character.offset(rand(Character.count)).first
    redirect_to shops_url(:loc_name => loc_name, :chara => chara.character)
  end

  #DBからcharacterのみ取得
  def get_charas
    return Character.pluck(:character)
  end
end
