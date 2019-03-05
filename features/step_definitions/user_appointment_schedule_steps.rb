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
