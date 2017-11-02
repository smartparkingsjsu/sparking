module ApplicationHelper
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

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end

