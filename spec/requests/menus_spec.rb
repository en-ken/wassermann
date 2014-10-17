require 'rails_helper'

RSpec.describe "MenusController", :type => :request do
  describe ":explore" do
    it "should nder index.html if args is nil" do
      get menus_explore_path
      expect(response).to render_template("menus/index")
    end

    it "should nder index.html if there are args" do
      get menus_explore_path, :feel=>'light'
      expect(response).to render_template("menus/suggest")
    end
   end
end
