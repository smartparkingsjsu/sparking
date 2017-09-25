class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super
    resource.update_attribute(:phone, params[:user][:phone].gsub(/\D/, ''))

    @get_license_plate = params[:user][:license_plate]
    @a = Licenseplate.create(user_id: @user.id, license_plate: @get_license_plate)
    @a.save
  end

  # GET /resource/edit
  def edit
    super
    @licenseplates = Licenseplate.where(user_id: current_user.id)
  end

  def show
    super
    @licenseplates = Licenseplate.where(user_id: current_user.id)
  end

  # PUT /resource
  def update
    super
    new_params = params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :current_password)
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

    resource.update_attribute(:phone, params[:user][:phone].gsub(/\D/, ''))  
  end

  protected

  def after_update_path_for(resource)
    user_path(@user.id)
  end
  
  def sign_up_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
  end

end
