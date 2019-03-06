Given /^the following users exist:$/ do | table |
  table.hashes.each do |user|
    User.new(
        :email => user["email"],
        :password => user["password"],
        :phone => user["phone"],
        :first_name => user["first_name"],
        :last_name => user["last_name"]
      ).save!
  end
end

Given /^"(.*)" is logged in using password "(.*)"$/ do | email, password |
  visit new_user_session_path
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Log in"
end
