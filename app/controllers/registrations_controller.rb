class RegistrationsController < Devise::RegistrationsController

  def update
    super
    resource.update_attribute(:phone, params[:user][:phone].gsub(/\D/, ''))
  end

  protected

  def after_update_path_for(resource)
    user_path(@user.id)
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :current_password)
  end

end