require 'rails_helper'

RSpec.describe "Shops", :type => :request do
  describe "GET /shops" do
    it "should render index.html" do
      get shops_path
      expect(response).to have_http_status(200)
      expect(response).to render_template("shops/index", "layout/application")
    end

    it "should display menu name and location name" do
      get shops_path, :menu_name=>'うどん', :location_name=>'上野'
      expect(response).to have_http_status(200)
      expect(response).to render_template("shops/index", "layout/application")
      expect(response.body).to have_css('h1', text:'うどん')
      expect(response.body).to have_css('h1', text:'上野')
    end
  end
end
