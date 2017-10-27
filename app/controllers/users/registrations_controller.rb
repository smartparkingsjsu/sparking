class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super
    resource.update_attribute(:phone, params[:user][:phone].gsub(/\D/, ''))

    # @get_license_plate = params[:user][:license_plate]
    # @get_make = params[:user][:make]  
    # @get_color = params[:user][:color]
    # @get_year = params[:user][:year]
    
    # @a = Licenseplate.create(user_id: @user.id, license_plate: @get_license_plate, make: @get_make, color: @get_color, year: @get_year)
    # @a.save
    
    @user.licenseplates.build
  end

  # GET /resource/edit
  def edit
    super

    @user.licenseplates.build
    # @licenseplates = Licenseplate.where(user_id: current_user.id)
    # @make = Licenseplate.where(user_id: current_user.id)
    # @color = Licenseplate.where(user_id: current_user.id)
    # @year = Licenseplate.where(user_id: current_user.id)
  end

  def show
    super
    # @licenseplates = Licenseplate.where(user_id: current_user.id)
    # @make = Licenseplate.where(user_id: current_user.id)
    # @color = Licenseplate.where(user_id: current_user.id)
    # @year = Licenseplate.where(user_id: current_user.id)
  end

  # PUT /resource
  def update
    # @get_license_plate = params[:user][:license_plate]
    # @get_make = params[:user][:make]  
    # @get_color = params[:user][:color]
    # @get_year = params[:user][:year]
    
    # update_license_plate = Licenseplate.find(1)
    # update_license_plate.update_attributes(user_id: current_user.id, license_plate: @get_license_plate, make: @get_make, color: @get_color, year: @get_year)

    # new_params = params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :current_password)

    change_password = true
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      new_params = params.require(:user).permit(:name, :email, :phone)
      change_password = false
    end

    @user = User.find(current_user.id)
    is_valid = false

    if change_password
      is_valid = @user.update_with_password(new_params)
    else
      is_valid = @user.update_without_password(new_params)
    end

    if is_valid
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end

    unless params[:user][:phone].nil?
      resource.update_attribute(:phone, params[:user][:phone].gsub(/\D/, ''))
    end
  end

  protected

  def after_update_path_for(resource)
    user_path(@user.id)
  end
  
  def sign_up_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, licenseplates_attributes: Licenseplate.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
