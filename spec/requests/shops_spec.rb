require 'rails_helper'

RSpec.describe "Shops", :type => :request do
  describe "GET /shops" do
    it "should render index.html" do
      get shops_path
      expect(response).to have_http_status(200)
      expect(response).to render_template("shops/index", "layout/application")
    end
  end
end
