require 'rails_helper'

RSpec.describe ShopsController, :type => :controller do
=begin
  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code and renders the index template" do
      get :index, :menu_name => 'うどん', :loc_name=>'渋谷駅'
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  describe "#get_json_data" do
    controller(ShopsController) do
      def index
        @menu_name = "うどん"
        @loc_name = "渋谷駅"
        @data = JSON.parse (get_json_data(@loc_name))
      end
    end

    it "should return data" do
      get :index
      expect(assigns[:data]).not_to eq(nil)
    end
  end
=end
end
