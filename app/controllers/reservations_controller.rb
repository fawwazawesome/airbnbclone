class ReservationsController < ApplicationController
	def create
		reservation = Reservation.new(reservation_params)
		reservation.user_id = current_user.id
		reservation.listing_id = params[:listing_id]

		if reservation.save
			flash[:success] = "Successfully made reservation"
			ReservationMailer.new_reservation(reservation.user).deliver
		else
			flash[:error] = reservation.errors.full_messages.join(', ')	
		end	
		
		redirect_to listing_path(params[:listing_id])
	end


  private
  	def reservation_params
   	 	params.require(:reservation).permit(:start_date, :end_date)
  	end

end
