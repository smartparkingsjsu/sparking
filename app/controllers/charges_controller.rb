class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]
  before_action :set_garage
  before_action :check_garage_owner_super_admin?

  # GET /charges
  # GET /charges.json
  def search
  end

  def index
    if check_garage_owner_super_admin?
      if @garage.present?
        @bookings = Booking.joins(garage_spot: :garage).where("garage_spots.garage_id = ?", params[:garage_id])
        @charges = Charge.where(booking_id: @bookings)
      else
        @charges = Charge.all
      end
    else
      flash[:notice] = 'Unauthorize user!'
      redirect_to root_path
    end
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
  end

  # GET /charges/new
  def new
    @charge = Charge.new
  end

  # GET /charges/1/edit
  def edit
  end

  # POST /charges
  # POST /charges.json
  def create
    @charge = Charge.new(charge_params)

    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    def set_garage
      @garage = Garage.find(params[:garage_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:booking_id, :amount, :token, :paid)
    end
end
