class MenusController < ApplicationController
  def index
  end

  def explore
    render :action => "index"
  end

  def suggest
    @feel = params[:feel]
    if @feel == "light" then
      @menu = "うどん"
    else
      @menu = "ラーメン"
    end
    render :action => "suggest"
  end 
  
end
