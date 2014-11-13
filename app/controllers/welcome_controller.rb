class WelcomeController < ApplicationController
  def index
  end

  def choose
    render :layout => 'application', :action => "choice"
  end

end
