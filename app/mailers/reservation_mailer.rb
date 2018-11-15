class ReservationMailer < ApplicationMailer
	def new_reservation(user)
		@user = user
	   	mail(to: @user.email, subject: "New Reservation @ AirBnB")
	end
end
 
