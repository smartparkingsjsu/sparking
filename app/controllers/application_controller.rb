class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  helper_method :super_admin?, :garage_owner?, :check_garage_owner?, :check_super_admin?, :check_garage_owner_super_admin?, :garage_owner_super_admin?, :check_license_plate_exists?
  before_action :get_garage_id
  #around_action :catch_not_found

  private

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to(root_path,  :flash => { :notice => "Something goes very wrong!" }) unless Rails.env.development?
  end

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
