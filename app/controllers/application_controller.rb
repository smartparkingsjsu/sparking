class ApplicationController < ActionController::Base
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

  private

  def get_garage_times
    return [
        {"value" => 1, "time" => "1:00 hour"},
        {"value" => 2, "time" => "2:00 hours"},
        {"value" => 3, "time" => "3:00 hours"},
        {"value" => 4, "time" => "4:00 hours"}
    ]
  end

end
