require 'rails_helper'

RSpec.describe ShopsController, :type => :controller do
  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code and renders the index template" do
      get :index, :loc_name=>'渋谷駅'
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  describe "#get_json_data" do
    controller(ShopsController) do
      def index
        @data = JSON.parse (get_json_data)
      end
    end

    it "should return data" do
      get :index, :loc_name=>'渋谷駅', :menu_name=>'うどん'
      expect(assigns[:data]).not_to eq(nil)
    end
  end
end
