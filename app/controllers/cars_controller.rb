class CarsController < ApplicationController
  def new
    @car = Car.new
    @current_email = current_user.email
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to '/my_profile'
    else
      render :new
    end
  end

  def destroy
    @car = Car.where(VIN: params[:id])
    @car.destroy_all
    redirect_to "/my_profile"
  end

  private
    def car_params
      params.require(:car).permit(:VIN, :make, :model, :year, :email)
    end
end
