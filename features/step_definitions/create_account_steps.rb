When /^I fill in the sign up form$/ do
  fill_in("user_email", :with => "tstep916@tamu.edu")
  fill_in("user_password", :with => "password")
  fill_in("user_password_confirmation", :with => "password")
  find_button("Sign up").click
end

Then /^I should be taken back to the home page$/ do
  page.should have_content("3404 Bering Dr., Houston, TX 77057")
end

When /^I fill in the login form$/ do
  fill_in("user_email", :with => "tstep916@tamu.edu")
  fill_in("user_password", :with => "password")
  find_button("Log in").click
end
