class Users::ConfirmationsController < Devise::ConfirmationsController

  private
  def after_confirmation_path_for(resource_name, resource)
    user_path(@user.id)
  end
end