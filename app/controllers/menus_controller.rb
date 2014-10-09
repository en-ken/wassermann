class MenusController < ApplicationController
  def index
  end

  def explore
    count = 3
    if count < 3 then
      render :action => "index"
    else
      render :action => "suggest"
    end
  end
  
end
