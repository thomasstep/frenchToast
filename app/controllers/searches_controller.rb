class SearchesController < ApplicationController
    
    def new
        @search = Search.new
    end
    
    def create
        @search = Search.create(search_params)
        redirect_to @search
    end
    
    def show
        @search = Search.find(params[:id])
    end
    
    def destroy
        @search = Search.find(params[:id])
        @search.destroy
        
        redirect_to admin_path
    end
    
    def search_params
        params.require(:search).permit(:VIN, :email, :after_date, :before_date, :time)
    end
end
