class GarageSpotsController < ApplicationController
  before_action :set_garage_spot, only: [:show, :edit, :update, :destroy]
  before_action :find_garage
  before_action :check_garage_owner_super_admin?

  # GET /garage_spots
  # GET /garage_spots.json
  def index
    if @garage.nil?
      @garage_spots = GarageSpot.all
    else
      @garage_spots = GarageSpot.where("garage_id = ?", @garage)
    end
  end

  # GET /garage_spots/1
  # GET /garage_spots/1.json
  def show
  end

  # GET /garage_spots/new
  def new
    @garage_spot = GarageSpot.new
  end

  # GET /garage_spots/1/edit
  def edit
  end

  # POST /garage_spots
  # POST /garage_spots.json
  def create
    @garage_spot = GarageSpot.new(garage_spot_params)

    respond_to do |format|
      if @garage_spot.save
        format.html { redirect_to @garage_spot, notice: 'Garage spot was successfully created.' }
        format.json { render :show, status: :created, location: @garage_spot }
      else
        format.html { render :new }
        format.json { render json: @garage_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garage_spots/1
  # PATCH/PUT /garage_spots/1.json
  def update
    respond_to do |format|
      if @garage_spot.update(garage_spot_params)
        format.html { redirect_to @garage_spot, notice: 'Garage spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @garage_spot }
      else
        format.html { render :edit }
        format.json { render json: @garage_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garage_spots/1
  # DELETE /garage_spots/1.json
  def destroy
    @garage_spot.destroy
    respond_to do |format|
      format.html { redirect_to garage_spots_url, notice: 'Garage spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garage_spot
      @garage_spot = GarageSpot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garage_spot_params
      params.require(:garage_spot).permit(:garage_id, :spot_id, :serial)
    end

    def find_garage
      if params[:garage_id]
        @garage = Garage.find_by_id(params[:garage_id])
      end
    end
end
