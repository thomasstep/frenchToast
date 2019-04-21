class SearchesController < ApplicationController
    
    def new
        if(current_user.nil? or !current_user.admin?)
          redirect_to "/not_admin"
        else
            @search = Search.new
        end
    end
    
    def create
        @search = Search.create(search_params)
        redirect_to @search
    end
    
    def show
        if(current_user.nil? or !current_user.admin?)
          redirect_to "/not_admin"
        else
            @search = Search.find(params[:id])
        end
    end
    
    def destroy
        @search = Search.find(params[:id])
        @search.destroy
        
        redirect_to admin_path
    end
    
    def search_params
        params.require(:search).permit(:first_name, :last_name, :phone, :VIN, :email, :after_date, :before_date, :time)
    end
end
