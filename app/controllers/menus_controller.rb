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
      redirect_to :action => "suggest", :menu => @menu 
    end
  end

  def suggest
    @locations = Location.all
    @menu = params[:menu]
  end 
  
end
