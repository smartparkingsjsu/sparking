class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :super_admin?, :garage_owner?, :check_garage_owner?, :check_super_admin?, :check_garage_owner_super_admin?, :garage_owner_super_admin?, :check_license_plate_exists?
  before_action :get_garage_id

  # Gets called in all views and creates and instance of gon.garage_id for JS everywhere
  def get_garage_id
    if garage_owner?
      gon.garage_id = garage_owner?
    else
      gon.garage_id = -1
    end
  end

  def check_license_plate_exists?
    if garage_owner_super_admin?
      return true
    else
      if current_user.licenseplates.present?
        return true
      else
        return false
      end
    end
  end

  def check_garage_owner_super_admin?
    if super_admin? || garage_owner?.present?
      return true
    else
      redirect_to root_path, notice: 'You are not suppose to be here, kid!'
    end
  end

  def check_garage_owner?
    if !garage_owner?
      redirect_to root_path, notice: 'Garage Owner only! You are not suppose to be here!'
    end
  end

  def check_super_admin?
    if !super_admin?
      redirect_to root_path, notice: 'Super Admin only! You are not suppose to be here!'
    end
  end

  def super_admin?
    if current_user.present? && current_user.admin? && current_user.garage_id.nil?
      return true
    else
      return false
    end
  end

  def garage_owner_super_admin?
    if super_admin? || garage_owner?.present?
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

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to(:back,  :flash => { :notice => "Something goes very wrong!" })
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

  def get_booking_times
    return [
        {"value" => 1, "time" => "1:00 AM"},
        {"value" => 2, "time" => "2:00 AM"},
        {"value" => 3, "time" => "3:00 AM"},
        {"value" => 4, "time" => "4:00 AM"},
        {"value" => 5, "time" => "5:00 AM"},
        {"value" => 6, "time" => "6:00 AM"},
        {"value" => 7, "time" => "7:00 AM"},
        {"value" => 8, "time" => "8:00 AM"},
        {"value" => 9, "time" => "9:00 AM"},
        {"value" => 10, "time" => "10:00 AM"},
        {"value" => 11, "time" => "11:00 AM"},
        {"value" => 12, "time" => "12:00 PM"},
        {"value" => 13, "time" => "1:00 PM"},
        {"value" => 14, "time" => "2:00 PM"},
        {"value" => 15, "time" => "3:00 PM"},
        {"value" => 16, "time" => "4:00 PM"},
        {"value" => 17, "time" => "5:00 PM"},
        {"value" => 18, "time" => "6:00 PM"},
        {"value" => 19, "time" => "7:00 PM"},
        {"value" => 20, "time" => "8:00 PM"},
        {"value" => 21, "time" => "9:00 PM"},
        {"value" => 22, "time" => "10:00 PM"},
        {"value" => 23, "time" => "11:00 PM"},
        {"value" => 24, "time" => "12:00 AM"},
    ]
  end

end
