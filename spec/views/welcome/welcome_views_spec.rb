require 'rails_helper'

RSpec.describe "welcome/index", :type => :view do
  it "displays the landing page" do
    render
    expect(rendered).to include("3404 Bering Dr., Houston, TX 77057")
  end
end

RSpec.describe "welcome/schedule", :type => :view do
  it "displays the schedule appointment form" do
    render
    expect(rendered).to include("We'll never share your email with anyone else.")
  end
end
