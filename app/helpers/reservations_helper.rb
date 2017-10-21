module ReservationsHelper
  def get_unique_booking_id
    hashids = Hashids.new("$p@rk!ng", 4)
    @hash_booking_id = hashids.encode(@booking.id)
  end

  def reterive_booking_id
    hashids = Hashids.new("$p@rk!ng", 4)
    @booking_id = hashids.decode(@hash_booking_id)
  end

  def charge
    @token = params[:stripeToken]
    
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path #should not go into this
  end
end
