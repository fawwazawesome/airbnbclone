class Reservation < ApplicationRecord
	 belongs_to :user
	 belongs_to :listing

	 before_save :check_overlapping_dates, :check_owner

	 def total_price
		self.listing.price * (self.end_date - self.start_date).to_i
	 end

	 private
	 def check_overlapping_dates
	 	listing = self.listing

	 	listing.reservations.each do |reservation|
	 		if self.start_date <= reservation.end_date && reservation.start_date <= self.end_date
      			return errors.add(:overlap, "This date is unavailable")
	 		end
	 	end
	 end

	 def check_owner
	 	if self.user == self.listing.user
      		errors.add(:owner, "Can't make reservation for own listing")
      	end
	 end

end