class MenusController < ApplicationController
  def explore
# TODO: 3回目にはindexを表示する
#   render :action => "index"
    render 'suggest'
  end
end
