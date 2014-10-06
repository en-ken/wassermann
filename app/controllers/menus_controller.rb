class MenusController < ApplicationController
  def index
  end

  def suggest
    # search menu
    redirect_to "/suggest"
  end

  def explore
    count = 3
    if count < 3 then
      redirect_to "/suggest"
    else
      render "result"
    end
  end
end
