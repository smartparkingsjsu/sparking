class GaragesController < ApplicationController
  before_action :set_garage, only: [:show, :edit, :update, :destroy]
  before_action :set_garage_id, only: [:out, :out_success, :in_success, :retrieve]
  before_action :authenticate_user!
  before_action :check_garage_owner_super_admin?
  include ReservationsHelper

  # GET /garages
  # GET /garages.json
  def index
    if super_admin?
      @garages = Garage.all
    elsif garage_owner?
      redirect_to garage_path(garage_owner?)
    else
      flash[:notice] = 'Unauthorize user!'
      redirect_to root_path      
    end
  end

  def retrieve
    session[:booking_confirmation] = params[:booking_confirmation]
    @hash_booking_id = session[:booking_confirmation]

    reterive_booking_id

    @booking = Booking.where(id: @booking_id).joins(:garage_spot).where("garage_id = ?", @garage_id).first

    if @booking.nil?
      redirect_to garage_garages_search_path, notice: 'Unable to retreive booking with Booking Confirmation!'
    else
      session[:booking_id] = @booking_id
    end
  end

  def charged
    @booking_id = session[:booking_id]
    @charge = Charge.joins(booking: :user).where(booking_id: @booking_id).first
  
    if @charge.update_attributes(paid: true)
      flash[:notice] = 'You have paid your due successfully!'
    else
      redirect_to garage_garages_search_path, notice: 'Something goes wrong!' #Not going to happen
    end
  end

  # GET /garages/1
  # GET /garages/1.json
  def show    
    if super_admin? || (garage_owner?.to_i == params[:id].to_i)
      @skip_header = true
      @garage_times = get_garage_times
    else
      flash[:notice] = 'Unauthorize user!'
      redirect_to root_path
    end
  end

  # GET /garages/new
  def new
    @garage = Garage.new
  end

  # GET /garages/1/edit
  def edit
  end

  # GET /garages/1/check/out
  def out
    @skip_header = true
  end

  def search
    @skip_header = true
  end

  # GET /garages
  def garage_reservation
    @skip_header = true
  end

  def in_success
    get_booking_from_form
    in_logic
  end
  
  def out_success
    get_booking_from_form
    out_logic
  end

  def get_booking_from_form
    @hash_booking_id = params[:booking_id]
    reterive_booking_id

    @booking = Booking.where(id: @booking_id).joins(:garage_spot).where("garage_id = ?", @garage_id).first
  end

  def in_logic
    if @booking.nil?
      redirect_back(fallback_location: :back, notice: 'Booking not found!')
    end
  end

  def out_logic
    if @booking.nil?
      redirect_back(fallback_location: :back, notice: 'Booking not found!')
    elsif @booking.charge.paid == false
      redirect_back(fallback_location: :back, notice: 'Payment missing!')
    end
  end

  # POST /garages
  # POST /garages.json
  def create
    @garage = Garage.new(garage_params)

    respond_to do |format|
      if @garage.save
        format.html { redirect_to @garage, notice: 'Garage was successfully created.' }
        format.json { render :show, status: :created, location: @garage }
      else
        format.html { render :new }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garages/1
  # PATCH/PUT /garages/1.json
  def update
    respond_to do |format|
      if @garage.update(garage_params)
        format.html { redirect_to @garage, notice: 'Garage was successfully updated.' }
        format.json { render :show, status: :ok, location: @garage }
      else
        format.html { render :edit }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garages/1
  # DELETE /garages/1.json
  def destroy
    @garage.destroy
    respond_to do |format|
      format.html { redirect_to garages_url, notice: 'Garage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garage
      @garage = Garage.find(params[:id])
    end

    def set_garage_id
      @garage_id = Garage.find(params[:garage_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garage_params
      params.require(:garage).permit(:name, :address, :weekend, :weekday, :email, :notify, :zone)
    end
end
