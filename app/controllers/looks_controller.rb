class LooksController < ApplicationController

  @loc_name #場所のデータ保持用(indexからView経由でselectに渡す)
	@freewords #外見の検索用

	#「雰囲気で選ぶ」選択後の処理
  def index
		@loc_name = params[:location]
		@freewords = get_freewords
	end

	#雰囲気選択後の遷移
	def select
		redirect_to shops_url(:loc_name => params[:loc_name], :freewords => params[:freewords])
  end

	private #===== 以下プライベートメソッド =====
	
	#DBからfreewordsを取得
	def get_freewords
		return Looks.pluck(:freewords)
	end

end
