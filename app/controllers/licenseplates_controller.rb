class LicenseplatesController < ApplicationController
  before_action :set_licenseplate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /licenseplates
  # GET /licenseplates.json
  def index
    @licenseplates = Licenseplate.all
  end

  # GET /licenseplates/1
  # GET /licenseplates/1.json
  def show
  end

  # GET /licenseplates/new
  def new
    @licenseplate = Licenseplate.new
  end

  # GET /licenseplates/1/edit
  def edit
  end

  # POST /licenseplates
  # POST /licenseplates.json
  def create
    @licenseplate = Licenseplate.new(licenseplate_params)

    respond_to do |format|
      if @licenseplate.save
        format.html { redirect_to @licenseplate, notice: 'Licenseplate was successfully created.' }
        format.json { render :show, status: :created, location: @licenseplate }
      else
        format.html { render :new }
        format.json { render json: @licenseplate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licenseplates/1
  # PATCH/PUT /licenseplates/1.json
  def update
    respond_to do |format|
      if @licenseplate.update(licenseplate_params)
        format.html { redirect_to @licenseplate, notice: 'Licenseplate was successfully updated.' }
        format.json { render :show, status: :ok, location: @licenseplate }
      else
        format.html { render :edit }
        format.json { render json: @licenseplate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenseplates/1
  # DELETE /licenseplates/1.json
  def destroy
    @licenseplate.destroy
    respond_to do |format|
      format.html { redirect_to licenseplates_url, notice: 'Licenseplate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_licenseplate
      @licenseplate = Licenseplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def licenseplate_params
      params.require(:licenseplate).permit(:license_plate, :user_id)
    end
end
