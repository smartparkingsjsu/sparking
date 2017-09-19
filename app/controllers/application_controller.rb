class ApplicationController < ActionController::Base
  respond_to :html, :xml, :json
  protect_from_forgery with: :exception
  helper_method :super_admin?, :garage_owner?

  def super_admin?
    if current_user.present? && current_user.admin? && current_user.garage_id.nil?
      return true
    else
      return false
    end
  end

  def garage_owner?
    if current_user.present? && current_user.admin? && current_user.garage_id.present?
      return current_user.garage_id
    else
      return false
    end
  end

end
