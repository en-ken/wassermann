require 'rails_helper'

RSpec.describe "MenusController", :type => :request do
  describe ":explore" do
    it "should render index.html if args is nil" do
      get menus_explore_path
      expect(response).to render_template("menus/index")
    end

    it "should render suggest.html and display うどん if feel == 'light'" do
      get menus_explore_path, :feel=>'light'
      expect(response).to render_template("menus/suggest")
      expect(response.body).to include("うどん");
    end

    it "should render suggest.html display ラーメン if feel == 'heavy'" do
      get menus_explore_path, :feel=>'heavy'
      expect(response).to render_template("menus/suggest")
      expect(response.body).to include("ラーメン");
    end

    it "should render suggest.html display ラーメン if feel == 'unknown'" do
      get menus_explore_path, :feel=>'unknown'
      expect(response).to render_template("menus/suggest")
      expect(response.body).to include("ラーメン");
    end
  end
end
