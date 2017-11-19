class Users::ConfirmationsController < Devise::ConfirmationsController

  private
  def after_confirmation_path_for(resource_name, resource)
    user_users_license_plate_path(:user_id => @user.id)
  end
end