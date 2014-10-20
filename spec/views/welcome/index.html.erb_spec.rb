require 'spec_helper'

describe "welcome/index.html.erb", :type => :view do
  before do
    render
  end

  it "should display title" do
    expect(rendered).to include("あいまいランチ")
  end
end
