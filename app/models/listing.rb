class Listing < ApplicationRecord
 	belongs_to :user
 	has_many :reservations

 	mount_uploaders :images, ImageUploader

	scope :property, -> (property) { where property: property }
	scope :country, -> (country) { where("country ILIKE ?", "%#{country}%") }
	scope :rooms, -> (rooms) { where rooms: rooms }
	
end

 


