class RegistrationsController < Devise::RegistrationsController

    # POST /resource
    def create
      super
      @get_license_plate = params[:user][:license_plate]
      @a = Licenseplate.create(user_id: @user.id, license_plate: @get_license_plate)
      @a.save
    end

    # GET /resource/edit
    def edit
      super
      @licenseplates = Licenseplate.where(user_id: current_user.id)
    end

    def show
      super
      @licenseplates = Licenseplate.where(user_id: current_user.id)
    end

    # PUT /resource
    def update
      super
      @a = Licenseplate.create(user_id: "1", license_plate: "XYZ")
      @a.save
    end

      private
    
      def sign_up_params
        params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
      end
    
      def account_update_params
        params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :current_password)
      end
    end