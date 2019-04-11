require 'rails_helper'

RSpec.describe "welcome/index", :type => :view do
  it "displays the landing page" do
    render
    expect(rendered).to include("Come Visit Us")
  end
end

RSpec.describe "welcome/about_us", :type => :view do
  it "displays the about us page" do
    render
    expect(rendered).to include("Since 1979")
  end
end

RSpec.describe "welcome/services", :type => :view do
  it "displays the services offered" do
    render
    expect(rendered).to include("Alignment")
    expect(rendered).to include("A/C Services")
    expect(rendered).to include("Brakes")
    expect(rendered).to include("Check Engine Light")
    expect(rendered).to include("Drivetrain and Suspension")
    expect(rendered).to include("Exhaust System")
    expect(rendered).to include("Inspection")
  end
end
