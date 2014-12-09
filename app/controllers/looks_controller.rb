class LooksController < ApplicationController

	@loc_name #場所のデータ保持用(indexからView経由でselectに渡す)
	@freewords #外見の検索用

	#「雰囲気で選ぶ」選択後の処理
	def index
		@loc_name = params[:location]
		@looks = get_img_urls
	end

	#雰囲気選択後の遷移
	def select
		@freewords = get_freewords
		redirect_to shops_url(:loc_name => params[:loc_name], :freewords => params[:freewords])
	end
	
	private #===== 以下プライベートメソッド =====

	#DBからimg_urlを全て取得
	def get_img_urls
		return Looks.pluck(:img_url)
	end

	def get_freewords
		looks = Looks.find_by(looks:img_rul)
		return looks.freewords 
	end

end
