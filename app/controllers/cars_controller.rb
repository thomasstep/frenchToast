class CarsController < ApplicationController
  # GET /cars
  # GET /cars.json
  # def index
  #   @cars = Car.all
  # end

  # GET /cars/1
  # GET /cars/1.json
  # def show
  # end

  # GET /cars/new
  def new
    @car = Car.new
    @current_email = current_user.email
  end

  # GET /cars/1/edit
  # def edit
  # end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to '/my_profile'
    else
      render :new
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  # def update
  #   respond_to do |format|
  #     if @car.update(car_params)
  #       format.html { redirect_to @car, notice: 'Car was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @car }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @car.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.where(VIN: params[:id])
    @car.destroy_all
    redirect_to "/my_profile"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_car
    #   @car = Car.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:VIN, :make, :model, :year, :email)
    end
end
