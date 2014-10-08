class MenusController < ApplicationController
  def index
    render
  end
  def explore
    # search menu
    redirect_to "/result"
  end
end
