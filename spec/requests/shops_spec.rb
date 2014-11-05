require 'rails_helper'

RSpec.describe "Shops", :type => :request do
  describe "GET /shops" do
    it "should render index.html" do
      get shops_path
      expect(response).to have_http_status(200)
      expect(response).to render_template("shops/index", "layout/application")
    end

    it "should display menu name and location name" do
      get shops_path, :menu_name=>'うどん', :location_name=>'上野駅'
      expect(response).to have_http_status(200)
      expect(response).to render_template("shops/index", "layout/application")
      assert_select "h1", /うどん/ #部分一致
      #assert_select "h1", /上野駅/ #部分一致
    end
  end
end
