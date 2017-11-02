class NotifyMailer < ApplicationMailer
  def notify_owner(booking)
    @email = booking.garage_spot.garage.email
    @booking = booking

    mail(to: @email, subject: 'License Plate Misatch Found!')
  end
end
