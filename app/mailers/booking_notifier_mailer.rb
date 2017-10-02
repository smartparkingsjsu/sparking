class BookingNotifierMailer < ApplicationMailer
    default :from => 'smartparkingsjsu@gmail.com'
    
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_booking_reminder(user)
    @user = user
    mail(   :to => @user.email,
            :subject => "Hello World" )
    end    
end
