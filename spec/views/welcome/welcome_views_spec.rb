require 'rails_helper'

RSpec.describe "welcome/index", :type => :view do
  it "displays the landing page" do
    render
    expect(rendered).to include("3404 Bering Dr., Houston, TX 77057")
  end
end

RSpec.describe "welcome/about_us", :type => :view do
  it "displays the about us page" do
    render
    expect(rendered).to include("Since 1979")
  end
end

RSpec.describe "welcome/schedule", :type => :view do
  it "displays the schedule appointment form" do
    render
    expect(rendered).to include("We'll never share your email with anyone else.")
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
