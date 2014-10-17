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
      render :action => "suggest"  
    end
  end

  def suggest
  end 
  
end
