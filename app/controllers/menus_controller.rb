class MenusController < ApplicationController
  def index
  end

  def suggest
  end

  def explore
    count = 3
    if count < 3 then
      render :action => "index"
    else
      redirect_to :action => "suggest"
    end
  end
  
  def suggest
  end
end
