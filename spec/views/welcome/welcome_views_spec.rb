require 'rails_helper'

RSpec.describe "welcome/index", :type => :view do
  it "displays the landing page" do
    render
    expect(rendered).to include("3404 Bering Dr., Houston, TX 77057")
  end
end
