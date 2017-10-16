class BookingNotifierMailer < ApplicationMailer
    default :from => 'smartparkingsjsu@gmail.com'
    
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_booking_reminder(user, booking)
        @user = user
        @booking = booking

        mail(   :to => @user.email,
                :subject => "You have an upcoming booking in 24 hours" )
    end
    
    def send_booking_end_reminder(user, booking)
        @user = user
        @booking = booking
    
        mail(   :to => @user.email,
                :subject => "You have a booking that is going to end soon!" )
    end    
end
