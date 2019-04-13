require 'rails_helper'

RSpec.describe SearchesController, type: :controller do

    describe "POST create" do
      it "creates a new search" do
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
    end

    describe "GET show" do
      it "assigns the requested search as @search" do
        search = Search.create!
        params = {
          :id => search.to_param
        }
        get :show, params: params
        expect(assigns(:search)).to eq search
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
