require 'rails_helper'

RSpec.describe User, type: :model do
  describe "checking admin bool" do
    it "should only return true if the account is an admin (defaulted to false)" do
      adminUser = User.new(
          :email => "test1@gmail.com",
          :password => "test1234",
          :phone => "5555551231",
          :first_name => "Jane",
          :last_name => "Test",
          :admin => true
        )
      expect(adminUser.admin?).to eq(true)
    end
    it "should only return true if the account is an admin (defaulted to false)" do
      regUser = User.new(
          :email => "test1@gmail.com",
          :password => "test1234",
          :phone => "5555551231",
          :first_name => "Jane",
          :last_name => "Test"        )
      expect(regUser.admin?).to eq(false)
    end
  end
end
