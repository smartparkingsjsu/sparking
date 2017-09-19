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
        {"value" => 30, "time" => "30 mins"},
        {"value" => 60, "time" => "1:00 hour"},
        {"value" => 90, "time" => "1:30 hours"},
        {"value" => 120, "time" => "2:00 hours"},
    ]

  end

end
