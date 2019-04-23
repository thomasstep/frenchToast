require 'rails_helper'

RSpec.describe SearchesController, type: :controller do

    describe "POST create" do
      it "should only create a new search if the account is an admin" do
        adminUser = User.new(
            :email => "test1@gmail.com",
            :password => "test1234",
            :phone => "5555551231",
            :first_name => "Jane",
            :last_name => "Test",
            :admin => true
          )
        adminUser.save!
        sign_in adminUser
        parameters = {
          search: {
            VIN: '12345678901234567',
            email: 'valid email',
            after_date: '2019-05-10',
            before_date: '2019-05-20',
            time: 'Morning'
            }
          }
        expect do
          post :create, params: parameters
        end.to change(Search, :count).by(1)
      end
      # it "should redirect the requested new search if the account is not an admin" do
      #   regUser = User.new(
      #       :email => "email1@gmail.com",
      #       :password => "test1234",
      #       :phone => "5555551231",
      #       :first_name => "Jane",
      #       :last_name => "Test",
      #       :admin => false
      #     )
      #   regUser.save!
      #   sign_in regUser
      #   parameters = {
      #     search: {
      #       VIN: '12345678901234567',
      #       email: 'valid email',
      #       after_date: '2019-05-10',
      #       before_date: '2019-05-20',
      #       time: 'Morning'
      #       }
      #   }
      #   post :create, params: parameters
      #   expect(response).to redirect_to("/not_admin")
      # end
    end

    describe "GET show" do
      it "should only assign the requested search as @search if the account is an admin" do
        adminUser = User.new(
            :email => "test1@gmail.com",
            :password => "test1234",
            :phone => "5555551231",
            :first_name => "Jane",
            :last_name => "Test",
            :admin => true
          )
        adminUser.save!
        sign_in adminUser
        search = Search.create!
        params = {
          :id => search.to_param
        }
        get :show, params: params
        expect(assigns(:search)).to eq search
      end
      it "should redirect the requested search if the account is not an admin" do
        regUser = User.new(
            :email => "email1@gmail.com",
            :password => "test1234",
            :phone => "5555551231",
            :first_name => "Jane",
            :last_name => "Test",
            :admin => false
          )
        regUser.save!
        sign_in regUser
        search = Search.create!
        params = {
          :id => search.to_param
        }
        get :show, params: params
        expect(response).to redirect_to("/not_admin")
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested search" do
        search = Search.create!
        params = {
          :id => search.to_param
        }
        expect do
          delete :destroy, params: params
        end.to change(Search, :count).by(-1)
      end
    end
end
