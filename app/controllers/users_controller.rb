class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if super_admin?
      @user = User.all
    else
      flash[:notice] = 'Unauthorize user!'
      redirect_to root_path
    end
  end



  def show
    @user = User.find(params[:id])
    @charges = Charge.joins(:booking).where("user_id = ?", current_user.id)
    @licenseplates = Licenseplate.where(user_id: current_user.id)


  end

end